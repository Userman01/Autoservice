//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

enum AuthBySMSCode {
    enum GetScreens {
        struct Request {
        }
        
        struct Responce {
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
        }
        
        struct ViewModel {
        }
    }
}
