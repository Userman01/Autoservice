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
        if UserAuthService.shared.isUserAuthorized() {
            openAuthChoice()
            openAuthByAccount()
        } else {
            openAuthChoice()
        }
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
    
    private func openRegistration(mode: RegistrationMode = .registration, userRole: UserRoleType?) {
        authorizationRouter.openRegistration(mode: mode) { [weak self] cmd in
            switch cmd {
            case let .open(.authBySMSCode(viewModel)):
                self?.openAuthBySMSCode(viewModel: viewModel, userRole: userRole)
            }
        }
    }
    
    private func openAuthBySMSCode(viewModel: AuthBySMSCodeTypeViewModel, userRole: UserRoleType?) {
        authorizationRouter.openAuthBySMSCode(viewModel: viewModel) { [weak self] cmd in
            switch cmd {
            case let .open(.openPassportCreate(mode: mode, username: username, SMSCode: SMSCode)):
                self?.openPassportCreate(userRole: userRole, phoneNumber: viewModel.phoneNumber, mode: mode, username: username, SMSCode: SMSCode)
            }
        }
    }
    
    private func openPassportCreate(userRole: UserRoleType?, phoneNumber: String?, mode: RegistrationMode, username: String?, SMSCode: String?) {
        authorizationRouter.openPassportCreate(userRole: userRole, phoneNumber: phoneNumber, mode: mode, username: username, SMSCode: SMSCode, out: { [weak self] cmd in
            switch cmd {
            case let .open(.openWelcom(mode)):
                self?.openWelcome(mode: mode)
            }
        })
    }
    
    private func openAuthByAccount() {
        authorizationRouter.openAuthByAccount { [weak self] cmd in
            switch cmd {
            case .open(.openCreateNewPassword):
                self?.openRegistration(mode: .recovery, userRole: nil)
            case let .open(.openWelcome(mode)):
                self?.openWelcome(mode: mode)
            }
        }
    }
    
    private func openWelcome(mode: RegistrationMode, inMode: WelcomeInModel = WelcomeInModel()) {
        authorizationRouter.openWelcome(mode: mode, inMode: inMode) { [weak self] cmd in
            switch cmd {
            case .open(.openMain):
                self?.out(.openPrimary)
            }
        }
    }
}
