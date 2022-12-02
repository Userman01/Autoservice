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
    
    static var clientSMSCode: String {
        return "\(BaseURL.BVC)/api/sms/check/"
    }
    
    static var signUp: String {
        return "\(BaseURL.BVC)/api/auth/signup"
    }
}
