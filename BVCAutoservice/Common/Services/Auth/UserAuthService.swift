//
//  UserAuthService.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 12.12.2022.
//

import UIKit
import KeychainSwift

final class UserAuthService {
    static let shared = UserAuthService()
    
    var username: String?
    var password: String?
    
    func isUserAuthorized() -> Bool {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKeys.userName) != nil && keychain.get(KeychainKeys.accessToken) != nil
    }
}
