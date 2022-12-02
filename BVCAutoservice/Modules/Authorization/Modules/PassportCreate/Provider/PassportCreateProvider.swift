//
//  RegistrationProvider.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol PassportCreateProviderProtocol {
    
    /// Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, phoneNumber: String?, role: String?, password: String?, completion: @escaping (RequestResult<PassportCreateModel>) -> Void)
}

struct PassportCreateProvider: PassportCreateProviderProtocol {
    
    private let service: PassportCreateServiceProtocol
    
    init() {
        self.service = PassportCreateService()
    }
    
    // MARK: Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, phoneNumber: String?, role: String?, password: String?, completion: @escaping (RequestResult<PassportCreateModel>) -> Void) {
        service.fetchResultSendUserInfo(userName: userName, phoneNumber: phoneNumber, role: role, password: password, completion: completion)
  }
}
