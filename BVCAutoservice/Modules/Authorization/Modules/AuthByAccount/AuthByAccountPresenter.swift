//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountPresentationLogic {

    // Показ полей
    func presentFields(response: AuthByAccount.GetFields.Response)
    
    /// Показ установки состояния кнопки
    func presentSetButtonState(response: AuthByAccount.SetButtonState.Response)
    
    /// Показ ошибки
    func presentError(responce: AuthByAccount.Error.Response)
    
    /// Показ продолжения
    func presentSubmit(responce: AuthByAccount.Submit.Response)
    
    /// Установка биометрии
    func setBiometricAuth(response: AuthByAccount.SetBiometricAuth.Response)
    
    /// Показ проверки биометрии
    func presentBiometricAuth(response: AuthByAccount.BiometricAuth.Response)
    
    /// Показ проверки ранней установки
    func presentCheckLaunchedBefore(response: AuthByAccount.CheckLaunchedBefore.Response)
}

final class AuthByAccountPresenter: AuthByAccountPresentationLogic {

    weak var viewController: AuthByAccountDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: AuthByAccount.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: AuthByAccount.GetFields.ViewModel(result: viewModel))
    }
    
    // MARK: Показ установки состояния кнопки
    func presentSetButtonState(response: AuthByAccount.SetButtonState.Response) {
        viewController?.displaySetButtonState(viewModel: AuthByAccount.SetButtonState.ViewModel(isEnabledButton: response.isEnabledButton))
    }
    
    // MARK: Показ ошибки
    func presentError(responce: AuthByAccount.Error.Response) {
        viewController?.displayError(viewModel: AuthByAccount.Error.ViewModel(errorMessage: responce.errorMessage))
    }
    
    // MARK: Показ продолжения
    func presentSubmit(responce: AuthByAccount.Submit.Response) {
        let viewModel = AuthByAccount.Submit.ViewModel()
        viewController?.displaySubmit(viewModel: viewModel)
    }
    
    // MARK: Установка биометрии
    func setBiometricAuth(response: AuthByAccount.SetBiometricAuth.Response) {
        viewController?.setBiometricAuth(viewModel: AuthByAccount.SetBiometricAuth.ViewModel(pinCodeButtonType: response.pinCodeButtonType))
    }
    
    // MARK: Показ проверки биометрии
    func presentBiometricAuth(response: AuthByAccount.BiometricAuth.Response) {
        viewController?.displayBiometricAuth(viewModel: AuthByAccount.BiometricAuth.ViewModel())
    }
    
    // MARK: Показ проверки ранней установки
    func presentCheckLaunchedBefore(response: AuthByAccount.CheckLaunchedBefore.Response) {
        viewController?.displayCheckLaunchedBefore(viewModel: AuthByAccount.CheckLaunchedBefore.ViewModel(isLaunchedBefore: response.isLaunchedBefore))
    }
}

extension AuthByAccountPresenter {

    private func getViewModel() -> AuthByAccountViewModel {
        AuthByAccountViewModel(isEnabled: false)
    }
}
