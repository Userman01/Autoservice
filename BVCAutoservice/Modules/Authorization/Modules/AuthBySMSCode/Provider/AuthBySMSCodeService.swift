//
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeServiceProtocol {
    /// Отправка номера телефона при регистрации
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void)
    
    /// Отправка номера телефона при восстановлении
    func fetchResultSendPhoneNumberRecovery(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeRecoveryModel>) -> Void)
}

class AuthBySMSCodeService: AuthBySMSCodeServiceProtocol {
    
    private let apiClient = APIClient()
    
    // MARK: Отправка номера телефона при регистрации
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void) {
        let url = AuthorizationEndpoints.clientSMSCode + "\(SMSCode ?? "")" + "?number=" + "\(phoneNumber ?? "")"
        apiClient.post(url, model: AuthBySMSCodeModel.self, completion: completion)
    }
    
    // MARK: Отправка номера телефона при восстановлении
    func fetchResultSendPhoneNumberRecovery(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeRecoveryModel>) -> Void) {
        let url = AuthorizationEndpoints.clientSMSCodeRecovery + "\(SMSCode ?? "")" + "?number=" + "\(phoneNumber ?? "")"
        apiClient.post(url, model: AuthBySMSCodeRecoveryModel.self, completion: completion)
    }
}
