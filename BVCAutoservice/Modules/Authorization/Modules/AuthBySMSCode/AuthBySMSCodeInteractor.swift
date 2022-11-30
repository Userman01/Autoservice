//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeBusinessLogic {
    /// Запрос на получение экрана
    func getScreen(request: AuthBySMSCode.GetScreens.Request)
    
    /// Установка значения номера телефона
    func setPhoneNumberValue(request: AuthBySMSCode.SetPhoneNumberValue.Request)
    
    /// Продолжить
    func submit(request: AuthBySMSCode.Submit.Request)
}

final class AuthBySMSCodeInteractor: AuthBySMSCodeBusinessLogic {
    
    private let presenter: AuthBySMSCodePresentationLogic
    private let provider: AuthBySMSCodeProviderProtocol
    
    private var phoneNumber: String = ""
    private var isEnabledButton: Bool = false
    
    init(presenter: AuthBySMSCodePresentationLogic,
         provider: AuthBySMSCodeProviderProtocol = AuthBySMSCodeProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Запрос на получение экрана
    func getScreen(request: AuthBySMSCode.GetScreens.Request) {
        presenter.presentScreen(responce: AuthBySMSCode.GetScreens.Responce())
    }
    
    // MARK: Установка значения номера телефона
    func setPhoneNumberValue(request: AuthBySMSCode.SetPhoneNumberValue.Request) {
        phoneNumber = request.value
        isEnabledButton = phoneNumber.count == 11
        presenter.presentSetButtonState(response: AuthBySMSCode.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
    
    // MARK: Продолжить
    func submit(request: AuthBySMSCode.Submit.Request) {

    }
}
