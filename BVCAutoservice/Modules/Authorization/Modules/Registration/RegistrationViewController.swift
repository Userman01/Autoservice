//
//  AuthChoiceViewController.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

protocol RegistrationDisplayLogic: AnyObject {
    /// Отображения экрана
    func displayScreen(viewModel: Registration.GetScreens.ViewModel)
    
    /// Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: Registration.SetButtonState.ViewModel)
    
    /// Показ продолжения
    func displaySubmit(viewModel: Registration.Submit.ViewModel)
    
    /// Показ ошибки
    func displayError(viewModel: Registration.Error.ViewModel)
}

protocol RegistrationViewControllerDelegate: AnyObject {
    
    /// Установка значения номера телефона
    func setPhoneNumber(value: String)
    
    /// Продолжить
    func submit()
}

typealias RegistrationOut = (RegistrationOutCmd) -> Void
enum RegistrationOutCmd {
    case open(RegistrationNavigationType)
}

final class RegistrationViewController: UIViewController {
    
    private let interactor: RegistrationBusinessLogic
    
    private lazy var customView = self.view as? RegistrationView
    
    private let out: RegistrationOut
    
    init(interactor: RegistrationBusinessLogic, out: @escaping RegistrationOut) {
        self.interactor = interactor
        self.out = out
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = RegistrationView()
        self.view = view
        view.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }
    
    private func getScreen() {
        interactor.getScreen(request: Registration.GetScreens.Request())
    }
}

extension RegistrationViewController: RegistrationDisplayLogic {
    
    // MARK: Отображения экрана
    func displayScreen(viewModel: Registration.GetScreens.ViewModel) {
        customView?.configure(viewModel: viewModel.result)
    }
    
    // MARK: Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: Registration.SetButtonState.ViewModel) {
        customView?.setButtonState(isEnabled: viewModel.isEnabledButton)
    }
    
    // MARK: Показ продолжения
    func displaySubmit(viewModel: Registration.Submit.ViewModel) {
        stopFullScreenAnimatingIndicator()
        out(.open(.authBySMSCode(viewModel: viewModel.viewModel)))
    }
    
    // MARK: Показ ошибки
    func displayError(viewModel: Registration.Error.ViewModel) {
        stopFullScreenAnimatingIndicator()
        alert(message: viewModel.errorMessage)
    }
}

extension RegistrationViewController: RegistrationViewControllerDelegate {
    
    // MARK: Установка значения номера телефона
    func setPhoneNumber(value: String) {
        interactor.setPhoneNumberValue(request: Registration.SetPhoneNumberValue.Request(value: value))
    }
    
    // MARK: Продолжить
    func submit() {
        startFullScreenAnimatingIndicator()
        interactor.submit(request: Registration.Submit.Request())
    }
}
