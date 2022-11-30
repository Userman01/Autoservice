//
//  AuthChoiceDataFlow.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

enum Registration {
    enum GetScreens {
        struct Request {
        }
        
        struct Responce {
        }
        
        struct ViewModel {
            let result: RegistrationViewModel
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
