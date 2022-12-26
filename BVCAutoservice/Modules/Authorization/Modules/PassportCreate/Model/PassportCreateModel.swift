//
//  AuthChoiceModel.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 24.11.2022.
//

import Foundation

struct PassportCreateModel: Decodable {
    let id: Int
    let username: String
    let phone: String
    let role: String
    let accessToken: String
    let tokenType: String
}
