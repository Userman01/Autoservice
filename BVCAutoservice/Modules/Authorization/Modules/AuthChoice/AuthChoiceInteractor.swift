//
//  AuthChoiceInteractor.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol AuthChoiceBuisnessLogic {
    /// Запрос на получение экрана
    func getScreen(request: AuthChoice.GetScreens.Request)
}

final class AuthChoiceInteractor: AuthChoiceBuisnessLogic {
    
    private let presenter: AuthChoicePresentationLogic
    
    init(presenter: AuthChoicePresentationLogic) {
        self.presenter = presenter
    }
    
    /// Запрос на получение экрана
    func getScreen(request: AuthChoice.GetScreens.Request) {
        presenter.presentScreen(responce: AuthChoice.GetScreens.Responce())
    }
}
