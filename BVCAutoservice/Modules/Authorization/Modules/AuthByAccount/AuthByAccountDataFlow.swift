//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

enum AuthByAccount {

    // MARK: Получение полей
    enum GetFields {
        struct Request {
        }

        struct Response {
        }

        struct ViewModel {
            let result: AuthByAccountViewModel
        }
    }
    
    enum SetName {
        struct Request {
            let value: String
        }
        
        struct Responce {
        }
        
        struct ViewModel {
        }
    }
    
    enum SetNewPassport {
        struct Request {
            let value: String
        }
        
        struct Responce {
        }
        
        struct ViewModel {
        }
    }
    
    // MARK: Продолжить
    enum Submit {
        struct Request {
        }

        struct Response {
        }

        struct ViewModel {
        }
    }
    
    enum SetButtonState {
        struct Request {
        }

        struct Response {
            let isEnabledButton: Bool
        }

        struct ViewModel {
            let isEnabledButton: Bool
        }
    }
    
    // MARK: Ошибка
    enum Error {
        struct Request {
        }

        struct Response {
            let errorMessage: String
        }

        struct ViewModel {
            let errorMessage: String
        }
    }
}
