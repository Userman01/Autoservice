//
//  AuthorizationCoordinator.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import KeychainSwift

typealias AuthorizationCoordinatorOut = (AuthorizationCoordinatorOutCmd) -> Void
enum AuthorizationCoordinatorOutCmd {
    case openPrimary
}

final class AuthorizationCoordinator: BaseCoordinator {
    
    private let authorizationRouter: AuthorizationRouterProtocol
    private let out: AuthorizationCoordinatorOut
    
    init(router: RouterProtocol, out: @escaping AuthorizationCoordinatorOut) {
        self.authorizationRouter = AuthorizationRouter(router: router)
        self.out = out
    }
    
    override func start() {
       openAuthChoice()
    }
    
    private func openAuthChoice() {
        authorizationRouter.openAuthChoice { [weak self] cmd in
            switch cmd {
            case let .open(userRoleType):
                self?.openRegistration(userRole: userRoleType)
            case .openAuth:
                self?.openAuthByAccount()
            }
        }
    }
    
    private func openRegistration(userRole: UserRoleType) {
        authorizationRouter.openRegistration { [weak self] cmd in
            switch cmd {
            case let .open(.authBySMSCode(viewModel)):
                self?.openAuthBySMSCode(viewModel: viewModel, userRole: userRole)
            }
        }
    }
    
    private func openAuthBySMSCode(viewModel: AuthBySMSCodeTypeViewModel, userRole: UserRoleType) {
        authorizationRouter.openAuthBySMSCode(viewModel: viewModel) { [weak self] cmd in
            switch cmd {
            case .open:
                self?.authorizationRouter.openPassportCreate(userRole: userRole, phoneNumber: viewModel.phoneNumber, out: { [weak self] cmd in
                    switch cmd {
                    case .open(.openMain):
                        self?.out(.openPrimary)
                    }
                })
            }
        }
    }
    
    private func openAuthByAccount() {
        authorizationRouter.openAuthByAccount { [weak self] cmd in
            switch cmd {
            case .open(.openCreateNewPassword):
                self?.openCreateNewPassword()
            case .open(.openMain):
                self?.out(.openPrimary)
            }
        }
    }
    
    private func openCreateNewPassword() {
        print("open create new password")
    }
}
