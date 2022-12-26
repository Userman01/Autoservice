//
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeProviderProtocol {
    /// Отправка СМС кода при регистрации
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void)
    
    /// Отправка СМС кода при восстановлени
    func fetchResultSendPhoneNumberRecovery(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeRecoveryModel>) -> Void)
}

struct AuthBySMSCodeProvider: AuthBySMSCodeProviderProtocol {
    let dataStore: AuthBySMSCodeDataStore
    let service: AuthBySMSCodeServiceProtocol

    init(dataStore: AuthBySMSCodeDataStore = AuthBySMSCodeDataStore(), service: AuthBySMSCodeServiceProtocol = AuthBySMSCodeService()) {
        self.dataStore = dataStore
        self.service = service
    }

    // MARK: Отправка СМС кода
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void) {
        service.fetchResultSendPhoneNumber(SMSCode: SMSCode, phoneNumber: phoneNumber, completion: completion)
    }
    
    // MARK: Отправка СМС кода при восстановлени
    func fetchResultSendPhoneNumberRecovery(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeRecoveryModel>) -> Void) {
        service.fetchResultSendPhoneNumberRecovery(SMSCode: SMSCode, phoneNumber: phoneNumber, completion: completion)
    }
}
