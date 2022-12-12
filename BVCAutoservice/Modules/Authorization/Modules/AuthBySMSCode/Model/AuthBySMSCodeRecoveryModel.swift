//
//  AuthBySMSCodeRecoveryModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 12.12.2022.
//

import Foundation

struct AuthBySMSCodeRecoveryModel: Decodable {
    let status: String
    let expireDate: String
    let username: String
}
