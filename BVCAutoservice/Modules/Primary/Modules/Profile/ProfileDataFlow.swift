//
//  Profile module
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

enum Profile {

    // MARK: Получение полей
    enum GetFields {
        struct Request {
        }

        struct Response {
            let mode: ProfileMode
        }

        struct ViewModel {
            let result: ProfileViewModel
        }
    }
}
