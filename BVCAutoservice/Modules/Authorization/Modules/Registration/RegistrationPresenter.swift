//
//  AuthChoicePresenter.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol RegistrationPresentationLogic {
    /// Показ экранов онбординга
    func presentScreen(responce: Registration.GetScreens.Responce)
    
    /// Показ установки состояния кнопки
    func presentSetButtonState(response: Registration.SetButtonState.Response)
}

final class RegistrationPresenter: RegistrationPresentationLogic {
    
    weak var viewController: RegistrationDisplayLogic?
    
    // MARK: Показ экранов онбординга
    func presentScreen(responce: Registration.GetScreens.Responce) {
        let viewModel = RegistrationViewModel(isEnabled: false)
        viewController?.displayScreen(viewModel: Registration.GetScreens.ViewModel(result: viewModel))
    }
    
    // MARK: Показ установки состояния кнопки
    func presentSetButtonState(response: Registration.SetButtonState.Response) {
        viewController?.displaySetButtonState(viewModel: Registration.SetButtonState.ViewModel(isEnabledButton: response.isEnabledButton))
    }
}
