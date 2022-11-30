//
//  RegistrationProvider.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol RegistrationProviderProtocol {
    /// Отправка номера телефона
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void)
}

struct RegistrationProvider: RegistrationProviderProtocol {
    
    private let service: RegistrationServiceProtocol
    
    init() {
        self.service = RegistrationService()
    }
    
    // MARK: Отправка номера телефона
    func fetchResultSendPhoneNumber(phoneNumber: String?, completion: @escaping (RequestResult<RegistrationModel>) -> Void) {
        service.fetchResultSendPhoneNumber(phoneNumber: phoneNumber, completion: completion)
    }
}
