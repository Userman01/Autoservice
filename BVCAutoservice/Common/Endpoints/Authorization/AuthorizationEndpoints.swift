//
//  AuthorizationEndpoints.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

struct AuthorizationEndpoints {
    static var clientRegistrationOfNumber: String {
        return "\(BaseURL.BVC)/api/sms/send?number="
    }
    
    static var clientRecoveryOfNumber: String {
        return "\(BaseURL.BVC)/api/sms/send/forget-password?number="
    }
    
    static var clientSMSCode: String {
        return "\(BaseURL.BVC)/api/sms/check/"
    }
    
    static var clientSMSCodeRecovery: String {
        return "\(BaseURL.BVC)/api/sms/check/forget-password/"
    }
    
    static var signUp: String {
        return "\(BaseURL.BVC)/api/auth/signup"
    }
    
    static var signIn: String {
        return "\(BaseURL.BVC)/api/auth/signin"
    }
    
    static var signInRecovery: String {
        return "\(BaseURL.BVC)/api/auth/forget-password"
    }
}
