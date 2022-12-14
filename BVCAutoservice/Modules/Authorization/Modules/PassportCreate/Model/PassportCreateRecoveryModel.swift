//
//  PassportCreateRecoveryModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 12.12.2022.
//

import Foundation

struct PassportCreateRecoveryModel: Decodable {
    let id: Int
    let username: String
    let phone: String
    let role: String
    let accessToken: String
    let tokenType: String
}
