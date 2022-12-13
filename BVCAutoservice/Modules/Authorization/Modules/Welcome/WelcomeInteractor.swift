//
//  Welcome module
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol WelcomeBusinessLogic {

    // Получение полей
    func getFields(request: Welcome.GetFields.Request)
}

final class WelcomeInteractor: WelcomeBusinessLogic {

    private let provider: WelcomeProviderProtocol
    private let presenter: WelcomePresentationLogic

    init(provider: WelcomeProviderProtocol = WelcomeProvider(),
         presenter: WelcomePresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: Welcome.GetFields.Request) {
        provider.fetchFields(params: [:]) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(model):
                print(model)
                strongSelf.presenter.presentFields(response: Welcome.GetFields.Response())
            case let .failure(error):
                print(error.errorMessage)
            }
        }
    }
}