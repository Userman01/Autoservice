//
//  AuthChoiceViewModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 21.11.2022.
//

import UIKit

protocol PassportCreateTypeViewModel {
    var phoneNumber: String? { get set }
    var role: UserRoleType? { get set }
}

struct PassportCreateViewModel {
    let isEnabled: Bool
    let pinCodeLenght: Int
    let title: String
    let describeTitle: String
    let nameUser: String?
}

enum PassportCreateNavigationType {
    case openMain
}
