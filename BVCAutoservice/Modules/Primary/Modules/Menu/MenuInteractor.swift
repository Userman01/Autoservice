//
//  Menu module
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol MenuBusinessLogic {

    // Получение полей
    func getFields(request: Menu.GetFields.Request)
}

final class MenuInteractor: MenuBusinessLogic {

    private let provider: MenuProviderProtocol
    private let presenter: MenuPresentationLogic

    init(provider: MenuProviderProtocol = MenuProvider(),
         presenter: MenuPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: Menu.GetFields.Request) {
        presenter.presentFields(response: Menu.GetFields.Response())
    }
}
