//
//  Welcome module
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

enum Welcome {

    // MARK: Получение полей
    enum GetFields {
        struct Request {
            let mode: RegistrationMode
            var inModel: WelcomeInModel?
        }

        struct Response {
            let mode: RegistrationMode
            let userName: String
            let role: String
        }

        struct ViewModel {
            let result: WelcomeViewModel
        }
    }
}
