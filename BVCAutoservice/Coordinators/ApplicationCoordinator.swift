//
//  ApplicationCoordinator.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 03.11.2022.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private var router: RouterProtocol
    private var isAutorized = false
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        if isAutorized {
            runMainFlow()
        } else {
            runAuthFlow()
        }
    }
    
    private func runMainFlow() {
        
    }
    
    private func runAuthFlow() {
        
    }
}
