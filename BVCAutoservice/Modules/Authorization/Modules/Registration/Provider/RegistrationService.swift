//
//  RegistrationService.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol RegistrationServiceProtocol {
    /// Отправка номера телефона
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void)
}

struct RegistrationService: RegistrationServiceProtocol {
    
    private let apiClient = APIClient()
    
    // MARK: Отправка номера телефона
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void) {
        let url = AuthorizationEndpoints.clientRegistrationOfNumber
        let parameters = [
            "":""
        ]
        apiClient.post(url, model: RegistrationModel.self, completion: completion)
    }
}
