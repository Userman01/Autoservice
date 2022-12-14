//
//  AuthByAccount module
//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

protocol AuthByAccountDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: AuthByAccount.GetFields.ViewModel)
    
    /// Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: AuthByAccount.SetButtonState.ViewModel)
    
    /// Показ ошибки
    func displayError(viewModel: AuthByAccount.Error.ViewModel)
    
    /// Показ продолжения
    func displaySubmit(viewModel: AuthByAccount.Submit.ViewModel)
    
    /// Установка биометрии
    func setBiometricAuth(viewModel: AuthByAccount.SetBiometricAuth.ViewModel)
    
    /// Отображение биометрии
    func displayBiometricAuth(viewModel: AuthByAccount.BiometricAuth.ViewModel)
    
    /// Отображение ранее установки
    func displayCheckLaunchedBefore(viewModel: AuthByAccount.CheckLaunchedBefore.ViewModel)
}

protocol AuthByAccountViewControllerDelegate: AnyObject {
    /// Установка значения номера телефона
    func setName(value: String)
    
    /// Установка значения нового паспорта
    func setNewPassport(value: String)
    
    /// Открытие модуля
    func openCreateNewPassword()
    
    /// Продолжить
    func submit()
    
    /// Показ биометрии
    func showBiometricAuth()
}

typealias AuthByAccountOut = ((AuthByAccountOutCmd) -> Void)
enum AuthByAccountOutCmd {
    case open(AuthByAccountNavigationType)
}

final class AuthByAccountViewController: UIViewController {

    private let interactor: AuthByAccountBusinessLogic

    private lazy var customView = view as? AuthByAccountView
    private var out: AuthByAccountOut

    init(interactor: AuthByAccountBusinessLogic, out: @escaping AuthByAccountOut) {
        self.interactor = interactor
        self.out = out
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = AuthByAccountView(frame: UIScreen.main.bounds, delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getFields()
        checkLaunchedBefore()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }

    // MARK: Получение полей
    private func getFields() {
        interactor.getFields(request: AuthByAccount.GetFields.Request())
    }
    
    // MARK: Проверка биометрии
    private func biometricAuth() {
        interactor.biometricAuth(request: AuthByAccount.BiometricAuth.Request())
    }
    
    // MARK: Проверка ранее установки
    private func checkLaunchedBefore() {
        interactor.checkLaunchedBefore(request: AuthByAccount.CheckLaunchedBefore.Request())
    }
}

extension AuthByAccountViewController: AuthByAccountDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: AuthByAccount.GetFields.ViewModel) {
        customView?.configure(with: viewModel.result)
    }
    
    // MARK: Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: AuthByAccount.SetButtonState.ViewModel) {
        customView?.setButtonState(isEnabled: viewModel.isEnabledButton)
    }
    
    // MARK: Показ ошибки
    func displayError(viewModel: AuthByAccount.Error.ViewModel) {
        stopFullScreenAnimatingIndicator()
        alert(message: viewModel.errorMessage)
    }
    
    // MARK: Показ продолжения
    func displaySubmit(viewModel: AuthByAccount.Submit.ViewModel) {
        stopFullScreenAnimatingIndicator()
        out(.open(.openWelcome(.enter)))
    }
    
    // MARK: Установка биометрии
    func setBiometricAuth(viewModel: AuthByAccount.SetBiometricAuth.ViewModel) {
        customView?.showActionButton(with: viewModel.pinCodeButtonType)
    }
    
    // MARK: Отображение биометрии
    func displayBiometricAuth(viewModel: AuthByAccount.BiometricAuth.ViewModel) {
        out(.open(.openWelcome(.enter)))
    }
    
    // MARK: Отображение ранее установки
    func displayCheckLaunchedBefore(viewModel: AuthByAccount.CheckLaunchedBefore.ViewModel) {
        if viewModel.isLaunchedBefore {
            biometricAuth()
        }
    }
}

extension AuthByAccountViewController: AuthByAccountViewControllerDelegate {
    
    // MARK: Установка значения номера телефона
    func setName(value: String) {
        interactor.setName(request: AuthByAccount.SetName.Request(value: value))
    }
    
    // MARK: Установка значения нового паспорта
    func setNewPassport(value: String) {
        interactor.setNewPassport(request: AuthByAccount.SetNewPassport.Request(value: value))
    }
    
    // MARK: Открытие модуля
    func openCreateNewPassword() {
        out(.open(.openCreateNewPassword))
    }
    
    // MARK: Продолжить
    func submit() {
        startFullScreenAnimatingIndicator()
        interactor.submit(request: AuthByAccount.Submit.Request())
    }
    
    // MARK: Показ биометрии
    func showBiometricAuth() {
        biometricAuth()
    }
}
