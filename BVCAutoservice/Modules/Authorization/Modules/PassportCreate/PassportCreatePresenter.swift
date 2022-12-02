//
//  AuthChoicePresenter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol PassportCreatePresentationLogic {
    /// Показ экранов онбординга
    func presentScreen(responce: PassportCreate.GetScreens.Responce)
    
    /// Показ установки состояния кнопки
    func presentSetButtonState(response: PassportCreate.SetButtonState.Response)
}

final class PassportCreatePresenter: PassportCreatePresentationLogic {
    
    weak var viewController: PassportCreateDisplayLogic?
    
    // MARK: Показ экранов онбординга
    func presentScreen(responce: PassportCreate.GetScreens.Responce) {
        let viewModel = PassportCreateViewModel(isEnabled: false, pinCodeLenght: 8)
        viewController?.displayScreen(viewModel: PassportCreate.GetScreens.ViewModel(result: viewModel))
    }
    
    // MARK: Показ установки состояния кнопки
    func presentSetButtonState(response: PassportCreate.SetButtonState.Response) {
        viewController?.displaySetButtonState(viewModel: PassportCreate.SetButtonState.ViewModel(isEnabledButton: response.isEnabledButton))
    }
}
