//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeBusinessLogic {
    /// Запрос на получение экрана
    func getScreen(request: AuthBySMSCode.GetScreens.Request)
    
    /// Установка значения СМС кода
    func setSMSCodeValue(request: AuthBySMSCode.SetPhoneNumberValue.Request)
    
    /// Продолжить
    func submit(request: AuthBySMSCode.Submit.Request)
}

final class AuthBySMSCodeInteractor: AuthBySMSCodeBusinessLogic {
    
    private let presenter: AuthBySMSCodePresentationLogic
    private let provider: AuthBySMSCodeProviderProtocol
    
    private var phoneNumber: String = ""
    private var SMSCode: String = ""
    private var isEnabledButton: Bool = false
    
    init(presenter: AuthBySMSCodePresentationLogic,
         provider: AuthBySMSCodeProviderProtocol = AuthBySMSCodeProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Запрос на получение экрана
    func getScreen(request: AuthBySMSCode.GetScreens.Request) {
        phoneNumber = request.phoneNumber ?? ""
        presenter.presentScreen(responce: AuthBySMSCode.GetScreens.Responce())
    }
    
    // MARK: Установка значения СМС кода
    func setSMSCodeValue(request: AuthBySMSCode.SetPhoneNumberValue.Request) {
        SMSCode = request.value
        isEnabledButton = SMSCode.count == 4
        presenter.presentSetButtonState(response: AuthBySMSCode.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
    
    // MARK: Продолжить
    func submit(request: AuthBySMSCode.Submit.Request) {
        provider.fetchResultSendPhoneNumber(SMSCode: SMSCode, phoneNumber: phoneNumber) { [weak self] result in
            switch result {
            case .success:
                self?.presenter.presentSubmit(responce: AuthBySMSCode.Submit.Response())
            case let .failure(message):
                self?.presenter.presentError(responce: AuthBySMSCode.Error.Response(errorMessage: message.errorMessage))
            }
        }
    }
}
