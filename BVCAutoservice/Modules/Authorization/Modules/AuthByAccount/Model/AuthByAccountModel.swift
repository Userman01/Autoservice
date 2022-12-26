//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

// Модель данных с запроса

struct AuthByAccountModel: Decodable {
    let id: Int
    let username: String
    let phone: String
    let role: String
    let accessToken: String
    let tokenType: String
}
