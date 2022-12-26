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
            let mode: RegistrationMode
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
            let phoneNumber: String?
            let mode: RegistrationMode
        }

        struct ViewModel {
            let viewModel: RegistrationBySMSCodeViewModel
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
    
    // MARK: Установка мода
    enum Mode {
        struct Request {
            let mode: RegistrationMode
        }
    }
}
