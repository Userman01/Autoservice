//
//  RegistrationProvider.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation
import KeychainSwift

protocol PassportCreateProviderProtocol {
    
    /// Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, phoneNumber: String?, role: String?, password: String?, completion: @escaping (RequestResult<PassportCreateModel>) -> Void)
    
    /// Отправка данных пользователя при восстановлении
    func fetchResultSendUserInfoRecovery(SMSCode: String?, phoneNumber: String?, password: String?, completion: @escaping (RequestResult<PassportCreateRecoveryModel>) -> Void)
    
    /// Сохранения токена
    func setToken(_ token: String)
    
    /// Сохранения логина
    func setLogin(_ login: String)
    
    /// Сохранения роли
    func setRole(_ role: String)
    
    // Установка раннего запуска
    func setLaunchedBefore()
}

struct PassportCreateProvider: PassportCreateProviderProtocol {
    
    private let service: PassportCreateServiceProtocol
    let keychain: KeychainSwift
    
    init(service: PassportCreateService = PassportCreateService(), keychain: KeychainSwift = KeychainSwift()) {
        self.service = service
        self.keychain = keychain
    }
    
    // MARK: Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, phoneNumber: String?, role: String?, password: String?, completion: @escaping (RequestResult<PassportCreateModel>) -> Void) {
        service.fetchResultSendUserInfo(userName: userName, phoneNumber: phoneNumber, role: role, password: password, completion: completion)
  }
    
    // MARK: Отправка данных пользователя при восстановлении
    func fetchResultSendUserInfoRecovery(SMSCode: String?, phoneNumber: String?, password: String?, completion: @escaping (RequestResult<PassportCreateRecoveryModel>) -> Void) {
        service.fetchResultSendUserInfoRecovery(
            SMSCode: SMSCode,
            phoneNumber: phoneNumber,
            password: password,
            completion: completion)
  }
    
    // MARK: Сохранения токена
    func setToken(_ token: String) {
        keychain.set(token, forKey: KeychainKeys.accessToken, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    // MARK: Сохранения логина
    func setLogin(_ login: String) {
        keychain.set(login, forKey: KeychainKeys.userName, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    // MARK: Сохранения роли
    func setRole(_ role: String) {
        keychain.set(role, forKey: KeychainKeys.userRole, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    func setLaunchedBefore() {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLaunchedBefore)
    }
}
