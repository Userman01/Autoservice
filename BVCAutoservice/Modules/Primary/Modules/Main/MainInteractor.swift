//
//  Main module
//  Created by postnikov_pp on 05/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainBusinessLogic {

    // Получение полей
    func getFields(request: Main.GetFields.Request)
}

final class MainInteractor: MainBusinessLogic {

    private let provider: MainProviderProtocol
    private let presenter: MainPresentationLogic

    init(provider: MainProviderProtocol = MainProvider(),
         presenter: MainPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: Main.GetFields.Request) {
        provider.fetchFields(params: [:]) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(model):
                print(model)
                strongSelf.presenter.presentFields(response: Main.GetFields.Response())
            case let .failure(error):
                print(error.errorMessage)
            }
        }
    }
}
