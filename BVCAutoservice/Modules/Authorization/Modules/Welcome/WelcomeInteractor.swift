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
    private var mode: RegistrationMode = .registration
    private var inModel: WelcomeInModel?
    private var userName: String = ""
    private var role: String = ""
    init(provider: WelcomeProviderProtocol = WelcomeProvider(),
         presenter: WelcomePresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: Welcome.GetFields.Request) {
        mode = request.mode
        inModel = request.inModel
        userName = provider.getUserName() ?? R.string.localizable.commonUser()
        role = provider.getRole() ?? UserRoleType.user.rawValue
        presenter.presentFields(response: Welcome.GetFields.Response(mode: mode, userName: userName, role: role))
    }
}
