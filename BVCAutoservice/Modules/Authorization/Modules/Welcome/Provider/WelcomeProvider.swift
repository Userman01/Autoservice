//
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//
import KeychainSwift

protocol WelcomeProviderProtocol {
    /// Получение имени юзера
    func getUserName() -> String?
    
    /// Получение роли
    func getRole() -> String?
}

final class WelcomeProvider: WelcomeProviderProtocol {

    private let service: WelcomeServiceProtocol
    let keychain: KeychainSwift

    init(service: WelcomeServiceProtocol = WelcomeService(), keychain: KeychainSwift = KeychainSwift()) {
        self.service = service
        self.keychain = keychain
    }
    
    // MARK: Получение имени юзера
    func getUserName() -> String? {
        keychain.get(KeychainKeys.userName)
    }
    
    // MARK: Получение роли
    func getRole() -> String? {
        keychain.get(KeychainKeys.userRole)
    }
}
