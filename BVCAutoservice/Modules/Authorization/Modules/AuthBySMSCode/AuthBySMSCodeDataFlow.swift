//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

enum AuthBySMSCode {
    enum GetScreens {
        struct Request {
            let phoneNumber: String?
            let mode: RegistrationMode
        }
        
        struct Responce {
            let mode: RegistrationMode
        }
        
        struct ViewModel {
            let result: AuthBySMSCodeViewModel
        }
    }
    
    enum SetPhoneNumberValue {
        struct Request {
            let value: String
        }
        
        struct Responce {
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
    
    // MARK: Продолжить
    enum Submit {
        struct Request {
        }
        
        struct Response {
            let mode: RegistrationMode
            let username: String?
            let SMSCode: String?
        }
        
        struct ViewModel {
            let mode: RegistrationMode
            let username: String?
            let SMSCode: String?
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
