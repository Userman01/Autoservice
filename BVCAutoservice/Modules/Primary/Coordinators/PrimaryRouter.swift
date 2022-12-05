//
//  MainRouter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.12.2022.
//

protocol PrimaryRouterProtocol {
    func openMain()
}

final class PrimaryRouter: PrimaryRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func openMain() {
        let mainController = MainBuilder()
            .build()
        router.setRootModules([mainController])
    }
}
