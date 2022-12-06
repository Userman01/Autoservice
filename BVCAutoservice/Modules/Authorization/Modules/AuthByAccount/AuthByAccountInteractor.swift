//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountBusinessLogic {

    // Получение полей
    func getFields(request: AuthByAccount.GetFields.Request)
}

final class AuthByAccountInteractor: AuthByAccountBusinessLogic {

    private let provider: AuthByAccountProviderProtocol
    private let presenter: AuthByAccountPresentationLogic

    init(provider: AuthByAccountProviderProtocol = AuthByAccountProvider(),
         presenter: AuthByAccountPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: AuthByAccount.GetFields.Request) {
        provider.fetchFields(params: [:]) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(model):
                print(model)
                strongSelf.presenter.presentFields(response: AuthByAccount.GetFields.Response())
            case let .failure(error):
                print(error.errorMessage)
            }
        }
    }
}