//
//  AuthorizationRouter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

protocol AuthorizationRouterProtocol {
    
}

final class AuthorizationRouter: AuthorizationRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
}
