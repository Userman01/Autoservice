//
//  CoordinatorFactory.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 03.11.2022.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    
    func makeApplicationCoordinator(router: RouterProtocol) -> ApplicationCoordinator
    
    func makeAuthorizationCoordinator(router: RouterProtocol, out: @escaping AuthorizationCoordinatorOut) -> AuthorizationCoordinator
    
    func makePrimaryCoordinator(router: RouterProtocol, out: @escaping PrimaryCoordinatorOut) -> PrimaryCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func makeApplicationCoordinator(router: RouterProtocol) -> ApplicationCoordinator {
        return ApplicationCoordinator(router: router, coordinatorFactory: self)
    }
    
    func makeAuthorizationCoordinator(router: RouterProtocol, out: @escaping AuthorizationCoordinatorOut) -> AuthorizationCoordinator {
        return AuthorizationCoordinator(router: router, out: out)
    }
    
    func makePrimaryCoordinator(router: RouterProtocol, out: @escaping PrimaryCoordinatorOut) -> PrimaryCoordinator {
        return PrimaryCoordinator(router: router, out: out)
    }
}
