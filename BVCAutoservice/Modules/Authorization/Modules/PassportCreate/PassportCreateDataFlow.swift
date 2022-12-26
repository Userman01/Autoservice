//
//  AuthChoiceDataFlow.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

enum PassportCreate {
    enum GetScreens {
        struct Request {
            let userRole: UserRoleType?
            let phoneNumber: String
            let mode: RegistrationMode
            let username: String?
            let SMSCode: String?
        }
        
        struct Responce {
            let mode: RegistrationMode
            let model: PassportCreateModel?
            let username: String?
        }
        
        struct ViewModel {
            let result: PassportCreateViewModel
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
    
    enum SetRepeatePassport {
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
