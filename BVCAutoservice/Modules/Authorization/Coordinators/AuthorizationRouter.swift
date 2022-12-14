//
//  AuthorizationRouter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

protocol AuthorizationRouterProtocol {
    
    func openAuthChoice(out: @escaping AuthChoiceOut)
    
    func openRegistration(mode: RegistrationMode, out: @escaping RegistrationOut)
    
    func openAuthBySMSCode(viewModel: AuthBySMSCodeTypeViewModel, out: @escaping AuthBySMSCodeOut)
    
    func openPassportCreate(userRole: UserRoleType?, phoneNumber: String?, mode: RegistrationMode, username: String?, SMSCode: String?, out: @escaping PassportCreateOut)
    
    func openAuthByAccount(out: @escaping AuthByAccountOut)
    
    func openWelcome(mode: RegistrationMode, inMode: WelcomeInModel, out: @escaping WelcomeOut)
}

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func openAuthChoice(out: @escaping AuthChoiceOut) {
        let authChoiceController = AuthChoiceBuilder()
            .build(out: out)
        router.push(authChoiceController)
    }
    
    func openRegistration(mode: RegistrationMode, out: @escaping RegistrationOut) {
        let registrationController = RegistrationBuilder()
            .set(mode: mode)
            .build(out: out)
        router.push(registrationController)
    }
    
    func openAuthBySMSCode(viewModel: AuthBySMSCodeTypeViewModel, out: @escaping AuthBySMSCodeOut) {
        let authBySMSCodeController = AuthBySMSCodeBuilder()
            .set(viewModel: viewModel)
            .build(out: out)
        router.push(authBySMSCodeController)
    }
    
    func openPassportCreate(userRole: UserRoleType?, phoneNumber: String?, mode: RegistrationMode, username: String?, SMSCode: String?, out: @escaping PassportCreateOut) {
        let passportCreate = PassportCreateBuilder()
            .set(role: userRole)
            .set(phoneNumber: phoneNumber)
            .set(mode: mode)
            .set(username: username)
            .set(SMSCode: SMSCode)
            .build(out: out)
        router.push(passportCreate)
    }
    
    func openAuthByAccount(out: @escaping AuthByAccountOut) {
        let authByAccount = AuthByAccountBuilder()
            .build(out: out)
        router.push(authByAccount)
    }
    
    func openWelcome(mode: RegistrationMode, inMode: WelcomeInModel, out: @escaping WelcomeOut) {
        let welcome = WelcomeBuilder()
            .set(mode: mode)
            .set(inModel: inMode)
            .build(out: out)
        router.setRootModules([welcome])
    }
}
