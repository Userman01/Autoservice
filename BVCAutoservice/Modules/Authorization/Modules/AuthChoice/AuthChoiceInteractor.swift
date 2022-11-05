//
//  AuthChoiceInteractor.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol AuthChoiceBuisnessLogic {
    
}

final class AuthChoiceInteractor: AuthChoiceBuisnessLogic {
    
    private let presenter: AuthChoicePresentationLogic
    
    init(presenter: AuthChoicePresentationLogic) {
        self.presenter = presenter
    }
}
