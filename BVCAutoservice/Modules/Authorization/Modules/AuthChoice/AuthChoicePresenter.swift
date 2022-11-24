//
//  AuthChoicePresenter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol AuthChoicePresentationLogic {
    /// Показ экранов онбординга
    func presentScreen(responce: AuthChoice.GetScreens.Responce)
}

final class AuthChoicePresenter: AuthChoicePresentationLogic {
    
    weak var viewController: AuthChoiceDisplayLogic?
    
    // MARK: Показ экранов онбординга
    func presentScreen(responce: AuthChoice.GetScreens.Responce) {
        let viewModel = AuthChoiceViewModel()
        let viewModel2 = AuthChoiceViewModel()
        viewController?.displayScreen(viewModel: AuthChoice.GetScreens.ViewModel(result: [viewModel, viewModel2]))
    }
}
