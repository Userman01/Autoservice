//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountBusinessLogic {

    // Получение полей
    func getFields(request: AuthByAccount.GetFields.Request)
    
    /// Установка значения номера телефона
    func setName(request: AuthByAccount.SetName.Request)
    
    /// Установка значения нового паспорта
    func setNewPassport(request: AuthByAccount.SetNewPassport.Request)
    
    /// Продолжить
    func submit(request: AuthByAccount.Submit.Request)
}

final class AuthByAccountInteractor: AuthByAccountBusinessLogic {

    private let provider: AuthByAccountProviderProtocol
    private let presenter: AuthByAccountPresentationLogic
    
    private var name: String = ""
    private var passwort: String = ""
    private var isEnabledButton: Bool = false
    
    init(provider: AuthByAccountProviderProtocol = AuthByAccountProvider(),
         presenter: AuthByAccountPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: AuthByAccount.GetFields.Request) {
        presenter.presentFields(response: AuthByAccount.GetFields.Response())
    }
    
    // MARK: Установка значения номера телефона
    func setName(request: AuthByAccount.SetName.Request) {
        name = request.value
        setButtonState()
    }
    
    // MARK: Установка значения нового паспорта
    func setNewPassport(request: AuthByAccount.SetNewPassport.Request) {
        passwort = request.value
        setButtonState()
    }
    
    // MARK: Продолжить
    func submit(request: AuthByAccount.Submit.Request) {
        provider.fetchResultSendUserInfo(userName: name, password: passwort) { [weak self] result in
            switch result {
            case .success:
                self?.presenter.presentSubmit(responce: AuthByAccount.Submit.Response())
            case let .failure(message):
                self?.presenter.presentError(responce: AuthByAccount.Error.Response(errorMessage: message.errorMessage))
            }
        }
    }
}

extension AuthByAccountInteractor {
    
    private func setButtonState() {
        isEnabledButton = name.count > 0 && passwort.count > 0
        presenter.presentSetButtonState(response: AuthByAccount.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
}
