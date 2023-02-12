//
//  MainRouter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.12.2022.
//

protocol PrimaryRouterProtocol {
    func openMainUser()
}

final class PrimaryRouter: PrimaryRouterProtocol {
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func openMainUser() {
        let mainUserController = MainUserBuilder()
            .build()
        router.setRootModules([mainUserController])
    }
}
