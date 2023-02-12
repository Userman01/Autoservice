//
//  AutoInfo module
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol AutoInfoBusinessLogic {

    // Получение полей
    func getFields(request: AutoInfo.GetFields.Request)
}

final class AutoInfoInteractor: AutoInfoBusinessLogic {

    private let provider: AutoInfoProviderProtocol
    private let presenter: AutoInfoPresentationLogic

    init(provider: AutoInfoProviderProtocol = AutoInfoProvider(),
         presenter: AutoInfoPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: AutoInfo.GetFields.Request) {
        presenter.presentFields(response: AutoInfo.GetFields.Response())
    }
}
