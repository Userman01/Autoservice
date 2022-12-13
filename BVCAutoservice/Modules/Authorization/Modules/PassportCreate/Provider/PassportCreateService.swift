//
//  RegistrationService.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol PassportCreateServiceProtocol {
    
    /// Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, phoneNumber: String?, role: String?, password: String?, completion: @escaping (RequestResult<PassportCreateModel>) -> Void)
    
    /// Отправка данных пользователя при восстановлении
    func fetchResultSendUserInfoRecovery(SMSCode: String?, phoneNumber: String?, password: String?, completion: @escaping (RequestResult<PassportCreateRecoveryModel>) -> Void)
}

struct PassportCreateService: PassportCreateServiceProtocol {
    
    private let apiClient = APIClient()

    // MARK: Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, phoneNumber: String?, role: String?, password: String?, completion: @escaping (RequestResult<PassportCreateModel>) -> Void) {
        let url = AuthorizationEndpoints.signUp
        let parameters: [String: Any] = [
            "username": userName ?? "",
            "phone": phoneNumber ?? "",
                "role": [role],
            "password": password ?? ""
        ]
        apiClient.post(url, parameters: parameters, model: PassportCreateModel.self, completion: completion)
  }

    // MARK: Отправка данных пользователя при восстановлении
    func fetchResultSendUserInfoRecovery(SMSCode: String?, phoneNumber: String?, password: String?, completion: @escaping (RequestResult<PassportCreateRecoveryModel>) -> Void) {
        let url = AuthorizationEndpoints.signInRecovery
        let parameters: [String: Any] = [
            "code": SMSCode ?? "",
            "number": phoneNumber ?? "",
            "newPassword": password ?? ""
        ]
        apiClient.post(url, parameters: parameters, model: PassportCreateRecoveryModel.self, completion: completion)
  }

}
