//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

import UIKit

protocol AuthBySMSCodePresentationLogic {
    /// Показ экранов онбординга
    func presentScreen(responce: AuthBySMSCode.GetScreens.Responce)
    
    /// Показ установки состояния кнопки
    func presentSetButtonState(response: AuthBySMSCode.SetButtonState.Response)
    
    /// Показ ошибки
    func presentError(responce: AuthBySMSCode.Error.Response)
    
    /// Показ продолжения
    func presentSubmit(responce: AuthBySMSCode.Submit.Response)
}

final class AuthBySMSCodePresenter: AuthBySMSCodePresentationLogic {
    
    weak var viewController: AuthBySMSCodeDisplayLogic?
    
    // MARK: Показ экранов онбординга
    func presentScreen(responce: AuthBySMSCode.GetScreens.Responce) {
        let viewModel = AuthBySMSCodeViewModel(isEnabled: false)
        viewController?.displayScreen(viewModel: AuthBySMSCode.GetScreens.ViewModel(result: viewModel))
    }
    
    // MARK: Показ установки состояния кнопки
    func presentSetButtonState(response: AuthBySMSCode.SetButtonState.Response) {
        viewController?.displaySetButtonState(viewModel: AuthBySMSCode.SetButtonState.ViewModel(isEnabledButton: response.isEnabledButton))
    }
    
    // MARK: Показ ошибки
    func presentError(responce: AuthBySMSCode.Error.Response) {
        viewController?.displayError(viewModel: AuthBySMSCode.Error.ViewModel(errorMessage: responce.errorMessage))
    }
    
    // MARK: Показ продолжения
    func presentSubmit(responce: AuthBySMSCode.Submit.Response) {
        let viewModel = AuthBySMSCode.Submit.ViewModel()
        viewController?.displaySubmit(viewModel: viewModel)
    }
}
