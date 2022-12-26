//
//  AuthChoiceDataFlow.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

enum AuthChoice {
    enum GetScreens {
        struct Request {
        }
        
        struct Responce {
        }
        
        struct ViewModel {
            let result: AuthChoiceViewModel
        }
    }
}
