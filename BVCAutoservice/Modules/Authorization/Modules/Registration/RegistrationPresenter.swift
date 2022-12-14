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
    
    /// Показ продолжения
    func presentSubmit(responce: Registration.Submit.Response)
    
    /// Показ ошибки
    func presentError(responce: Registration.Error.Response)
}

final class RegistrationPresenter: RegistrationPresentationLogic {
    
    weak var viewController: RegistrationDisplayLogic?
    
    // MARK: Показ экранов онбординга
    func presentScreen(responce: Registration.GetScreens.Responce) {
        let viewModel: RegistrationViewModel
        switch responce.mode {
        case .registration:
            viewModel = RegistrationViewModel(isEnabled: false, title: R.string.localizable.commonRegistration())
        case .recovery:
            viewModel = RegistrationViewModel(isEnabled: false, title: R.string.localizable.commonRecovery())
        default:
            viewModel = RegistrationViewModel(isEnabled: false, title: "")
        }
        
        viewController?.displayScreen(viewModel: Registration.GetScreens.ViewModel(result: viewModel))
    }
    
    // MARK: Показ установки состояния кнопки
    func presentSetButtonState(response: Registration.SetButtonState.Response) {
        viewController?.displaySetButtonState(viewModel: Registration.SetButtonState.ViewModel(isEnabledButton: response.isEnabledButton))
    }
    
    // MARK: Показ продолжения
    func presentSubmit(responce: Registration.Submit.Response) {
        let viewModel = Registration.Submit.ViewModel(viewModel: RegistrationBySMSCodeViewModel(phoneNumber: responce.phoneNumber, mode: responce.mode))
        viewController?.displaySubmit(viewModel: viewModel)
    }
    
    // MARK: Показ ошибки
    func presentError(responce: Registration.Error.Response) {
        viewController?.displayError(viewModel: Registration.Error.ViewModel(errorMessage: responce.errorMessage))
    }
}
