//
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeProviderProtocol {
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void)
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
}
