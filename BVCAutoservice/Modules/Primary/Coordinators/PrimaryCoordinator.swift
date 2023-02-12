//
//  MainCoordinator.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.12.2022.
//

import Foundation

typealias PrimaryCoordinatorOut = (PrimaryCoordinatorOutCmd) -> Void
enum PrimaryCoordinatorOutCmd {
}

final class PrimaryCoordinator: BaseCoordinator {
    private let primaryRouter: PrimaryRouterProtocol
    private let out: PrimaryCoordinatorOut
    
    init(router: RouterProtocol, out: @escaping PrimaryCoordinatorOut) {
        self.out = out
        primaryRouter = PrimaryRouter(router: router)
    }
    
    override func start() {
        openMainUser()
    }
    
    private func openMainUser() {
        primaryRouter.openMainUser()
    }
}
