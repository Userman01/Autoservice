//
//  PassportCreateRecoveryModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 12.12.2022.
//

import Foundation

struct PassportCreateRecoveryModel: Decodable {
    let id: String
    let username: String
    let phone: String
    let roles: [String]
    let accessToken: String
    let tokenType: String
}
