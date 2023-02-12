//
//  Profile module
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol ProfileBusinessLogic {

    // Получение полей
    func getFields(request: Profile.GetFields.Request)
}

final class ProfileInteractor: ProfileBusinessLogic {

    private let provider: ProfileProviderProtocol
    private let presenter: ProfilePresentationLogic
    private let mode: ProfileMode

    init(provider: ProfileProviderProtocol = ProfileProvider(),
         presenter: ProfilePresentationLogic,
         mode: ProfileMode) {
        self.provider = provider
        self.presenter = presenter
        self.mode = mode
    }

    // MARK: Получение полей
    func getFields(request: Profile.GetFields.Request) {
        presenter.presentFields(response: Profile.GetFields.Response(mode: mode))
    }
}
