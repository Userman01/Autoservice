//
//  MainUser module
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

enum MainUser {

    // MARK: Получение полей
    enum GetFields {
        struct Request {
        }

        struct Response {
            let result: RequsetResult
        }

        struct ViewModel {
            let state: ViewControllerState
        }
    }
    
    enum RequsetResult {
        case failure(String)
        case success(state: MainUserModel)
    }
    
    enum ViewControllerState {
        case loading
        case result(MainUserViewModel)
        case error(message: String)
    }
}
