//
//  AuthorizationCoordinator.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import KeychainSwift

typealias AuthorizationCoordinatorOut = (AuthorizationCoordinatorOutCmd) -> Void
enum AuthorizationCoordinatorOutCmd {
    case openMain
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
                print("auth")
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
                self?.authorizationRouter.openPassportCreate(userRole: userRole, phoneNumber: viewModel.phoneNumber, out: { cmd in
                    print(cmd)
                })
            }
        }
    }
}
