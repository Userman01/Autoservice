//
//  MainUser module
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainUserBusinessLogic {

    // Получение полей
    func getFields(request: MainUser.GetFields.Request)
}

final class MainUserInteractor: MainUserBusinessLogic {

    private let provider: MainUserProviderProtocol
    private let presenter: MainUserPresentationLogic

    init(provider: MainUserProviderProtocol = MainUserProvider(),
         presenter: MainUserPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: MainUser.GetFields.Request) {
        presenter.presentFields(response: MainUser.GetFields.Response(result: .success(state: MainUserModel(name: "sdfsdf"))))
    }
}
