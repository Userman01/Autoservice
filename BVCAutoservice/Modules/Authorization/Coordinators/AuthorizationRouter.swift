//
//  AuthorizationRouter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

protocol AuthorizationRouterProtocol {
    
    func openAuthChoice(out: @escaping AuthChoiceOut)
}

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func openAuthChoice(out: @escaping AuthChoiceOut) {
        let authChoiceController = AuthChoiceBuilder()
            .build()
        router.push(authChoiceController)
    }
}
