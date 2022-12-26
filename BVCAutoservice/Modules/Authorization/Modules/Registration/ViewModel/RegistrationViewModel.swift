//
//  AuthChoiceViewModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 21.11.2022.
//

import UIKit

struct RegistrationViewModel {
    let isEnabled: Bool
    let title: String
}

enum RegistrationNavigationType {
    case authBySMSCode(viewModel: RegistrationBySMSCodeViewModel)
}

struct RegistrationBySMSCodeViewModel: AuthBySMSCodeTypeViewModel {
    var phoneNumber: String?
    var mode: RegistrationMode
}
