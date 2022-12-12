//
//  AuthBySMSCodeViewModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol AuthBySMSCodeTypeViewModel {
    var phoneNumber: String? { get set }
    var mode: RegistrationMode { get set }
}

struct AuthBySMSCodeViewModel {
    let isEnabled: Bool
    let title: String
}

enum AuthBySMSCodeNavigationType {
    case openPassportCreate(mode: RegistrationMode, username: String?, SMSCode: String?)
}
