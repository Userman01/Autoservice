//
//  Created by postnikov_pp on 30/11/2022.
//

protocol AuthBySMSCodeServiceProtocol {
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void)
}

class AuthBySMSCodeService: AuthBySMSCodeServiceProtocol {
    
    private let apiClient = APIClient()
    
    // MARK: Отправка номера телефона
    func fetchResultSendPhoneNumber(SMSCode: String?, phoneNumber: String?, completion: @escaping (RequestResult<AuthBySMSCodeModel>) -> Void) {
        let url = AuthorizationEndpoints.clientSMSCode + "\(SMSCode ?? "")" + "?number=" + "\(phoneNumber ?? "")"
        apiClient.post(url, model: AuthBySMSCodeModel.self, completion: completion)
    }
}
