//
//  AuthBySMSCodeViewModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

protocol AuthBySMSCodeTypeViewModel {
    var phoneNumber: String? { get set }
}

struct AuthBySMSCodeViewModel {
    let isEnabled: Bool
}

enum AuthBySMSCodeNavigationType {
    case openPassportCreate
}
