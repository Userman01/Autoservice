//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//
import KeychainSwift

protocol AuthByAccountProviderProtocol {
    /// Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, password: String?, completion: @escaping (RequestResult<AuthByAccountModel>) -> Void)
    
    /// Получение токена
    func getToken() -> String?
    
    // Проверка раннего запуска
    func checkIsLaunchedBefore() -> Bool
    
    /// Сохранения токена
    func setToken(_ token: String)
    
    /// Сохранения логина
    func setLogin(_ login: String)
    
    /// Сохранения роли
    func setRole(_ role: String)
    
    // Установка раннего запуска
    func setLaunchedBefore()
}

final class AuthByAccountProvider: AuthByAccountProviderProtocol {

    private let service: AuthByAccountServiceProtocol
    let keychain: KeychainSwift

    init(service: AuthByAccountServiceProtocol = AuthByAccountService(), keychain: KeychainSwift = KeychainSwift()) {
        self.service = service
        self.keychain = keychain
    }

    // MARK: Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, password: String?, completion: @escaping (RequestResult<AuthByAccountModel>) -> Void) {
        service.fetchResultSendUserInfo(userName: userName, password: password, completion: completion)
  }
    
    // MARK: Получение токена
    func getToken() -> String? {
        keychain.get(KeychainKeys.accessToken)
    }
    
    func checkIsLaunchedBefore() -> Bool {
        UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLaunchedBefore)
    }
    
    // MARK: Сохранения логина
    func setLogin(_ login: String) {
        keychain.set(login, forKey: KeychainKeys.userName, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    // MARK: Сохранения токена
    func setToken(_ token: String) {
        keychain.set(token, forKey: KeychainKeys.accessToken, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    // MARK: Сохранения роли
    func setRole(_ role: String) {
        keychain.set(role, forKey: KeychainKeys.userRole, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }
    
    func setLaunchedBefore() {
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLaunchedBefore)
    }
}
