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
    
    init(router: RouterProtocol) {
        self.authorizationRouter = AuthorizationRouter(router: router)
    }
}
