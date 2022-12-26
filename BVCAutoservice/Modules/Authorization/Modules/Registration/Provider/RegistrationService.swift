//
//  RegistrationService.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol RegistrationServiceProtocol {
    /// Отправка номера телефона при регистрации
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void)
    
    /// Отправка номера телефона при восстановлении
    func fetchResultSendPhoneNumberRecovery(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationRecoveryModel>) -> Void)
}

struct RegistrationService: RegistrationServiceProtocol {
    
    private let apiClient = APIClient()
    
    // MARK: Отправка номера телефона при регистрации
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void) {
        let url = AuthorizationEndpoints.clientRegistrationOfNumber + "\(phoneNumber ?? "")"
        apiClient.post(url, model: RegistrationModel.self, completion: completion)
    }
    
    // MARK: Отправка номера телефона при восстановлении
    func fetchResultSendPhoneNumberRecovery(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationRecoveryModel>) -> Void) {
        let url = AuthorizationEndpoints.clientRecoveryOfNumber + "\(phoneNumber ?? "")"
        apiClient.post(url, model: RegistrationRecoveryModel.self, completion: completion)
    }
}
