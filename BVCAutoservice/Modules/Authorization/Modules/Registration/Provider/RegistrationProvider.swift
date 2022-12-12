//
//  RegistrationProvider.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol RegistrationProviderProtocol {
    /// Отправка номера телефона при регистрации
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void)
    
    /// Отправка номера телефона при восстановлени
    func fetchResultSendPhoneNumberRecovery(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationRecoveryModel>) -> Void)
}

struct RegistrationProvider: RegistrationProviderProtocol {
    
    private let service: RegistrationServiceProtocol
    
    init() {
        self.service = RegistrationService()
    }
    
    // MARK: Отправка номера телефона при регистрации
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void) {
        service.fetchResultSendPhoneNumber(phoneNumber: phoneNumber, completion: completion)
    }
    
    // MARK: Отправка номера телефона при восстановлени
    func fetchResultSendPhoneNumberRecovery(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationRecoveryModel>) -> Void) {
        service.fetchResultSendPhoneNumberRecovery(phoneNumber: phoneNumber, completion: completion)
    }
}
