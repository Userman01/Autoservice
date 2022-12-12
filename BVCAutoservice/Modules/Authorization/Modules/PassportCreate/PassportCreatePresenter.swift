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
    
    /// Показ ошибки
    func presentError(responce: PassportCreate.Error.Response)
    
    /// Показ продолжения
    func presentSubmit(responce: PassportCreate.Submit.Response)
}

final class PassportCreatePresenter: PassportCreatePresentationLogic {
    
    weak var viewController: PassportCreateDisplayLogic?
    
    // MARK: Показ экранов онбординга
    func presentScreen(responce: PassportCreate.GetScreens.Responce) {
        let viewModel: PassportCreateViewModel
        switch responce.mode {
        case .registration:
            viewModel = PassportCreateViewModel(
                isEnabled: false,
                pinCodeLenght: 8,
                title: R.string.localizable.commonRegistration(),
                describeTitle: R.string.localizable.passportCreateDescribeLabelTitle(),
                nameUser: nil)
        case .recovery:
            viewModel = PassportCreateViewModel(
                isEnabled: false,
                pinCodeLenght: 8,
                title: R.string.localizable.commonRecovery(),
                describeTitle: R.string.localizable.passportCreateDescribeLabelTitle(),
                nameUser: responce.username)
        }
        viewController?.displayScreen(viewModel: PassportCreate.GetScreens.ViewModel(result: viewModel))
    }
    
    // MARK: Показ установки состояния кнопки
    func presentSetButtonState(response: PassportCreate.SetButtonState.Response) {
        viewController?.displaySetButtonState(viewModel: PassportCreate.SetButtonState.ViewModel(isEnabledButton: response.isEnabledButton))
    }
    
    // MARK: Показ ошибки
    func presentError(responce: PassportCreate.Error.Response) {
        viewController?.displayError(viewModel: PassportCreate.Error.ViewModel(errorMessage: responce.errorMessage))
    }
    
    // MARK: Показ продолжения
    func presentSubmit(responce: PassportCreate.Submit.Response) {
        let viewModel = PassportCreate.Submit.ViewModel()
        viewController?.displaySubmit(viewModel: viewModel)
    }
}
