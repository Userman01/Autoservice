//
//  AuthorizationRouter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

protocol AuthorizationRouterProtocol {
    
    func openAuthChoice(out: @escaping AuthChoiceOut)
    
    func openRegistration(out: @escaping RegistrationOut, userRoleType: UserRoleType)
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
    
    func openRegistration(out: @escaping RegistrationOut, userRoleType: UserRoleType) {
        let registration = RegistrationBuilder()
            .set(userRoleType: userRoleType)
            .build(out: out)
        router.push(registration)
    }
}
