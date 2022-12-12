//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

import UIKit

protocol AuthBySMSCodeDisplayLogic: AnyObject {
    /// Отображения экрана
    func displayScreen(viewModel: AuthBySMSCode.GetScreens.ViewModel)
    
    /// Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: AuthBySMSCode.SetButtonState.ViewModel)
    
    /// Показ ошибки
    func displayError(viewModel: AuthBySMSCode.Error.ViewModel)
    
    /// Показ продолжения
    func displaySubmit(viewModel: AuthBySMSCode.Submit.ViewModel)
}

protocol AuthBySMSCodeViewControllerDelegate: AnyObject {
    /// Установка значения SMS кода
    func setSMSCode(value: String)
    
    /// Продолжить
    func submit()
}

typealias AuthBySMSCodeOut = (AuthBySMSCodeOutCmd) -> Void
enum AuthBySMSCodeOutCmd {
    case open(AuthBySMSCodeNavigationType)
}

final class AuthBySMSCodeViewController: UIViewController {
    let interactor: AuthBySMSCodeBusinessLogic
    
    private lazy var customView = self.view as? AuthBySMSCodeView

    private let out: AuthBySMSCodeOut
    private var viewModel: AuthBySMSCodeTypeViewModel?
    
    init(interactor: AuthBySMSCodeBusinessLogic, viewModel: AuthBySMSCodeTypeViewModel?, out: @escaping AuthBySMSCodeOut) {
        self.interactor = interactor
        self.out = out
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = AuthBySMSCodeView()
        self.view = view
        view.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        getScreen(phoneNumber: viewModel.phoneNumber, mode: viewModel.mode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }

    private func getScreen(phoneNumber: String?, mode: RegistrationMode) {
        interactor.getScreen(request: AuthBySMSCode.GetScreens.Request(phoneNumber: phoneNumber, mode: mode))
    }
}

extension AuthBySMSCodeViewController: AuthBySMSCodeDisplayLogic {
    
    // MARK: Отображения экрана
    func displayScreen(viewModel: AuthBySMSCode.GetScreens.ViewModel) {
        customView?.configure(viewModel: viewModel.result)
    }
    
    // MARK: Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: AuthBySMSCode.SetButtonState.ViewModel) {
        customView?.setButtonState(isEnabled: viewModel.isEnabledButton)
    }
    
    // MARK: Показ ошибки
    func displayError(viewModel: AuthBySMSCode.Error.ViewModel) {
        stopFullScreenAnimatingIndicator()
        alert(message: viewModel.errorMessage)
    }
    
    // MARK: Показ продолжения
    func displaySubmit(viewModel: AuthBySMSCode.Submit.ViewModel) {
        stopFullScreenAnimatingIndicator()
        out(.open(.openPassportCreate(mode: viewModel.mode, username: viewModel.username, SMSCode: viewModel.SMSCode)))
    }
}

extension AuthBySMSCodeViewController: AuthBySMSCodeViewControllerDelegate {
    
    // MARK: Установка значения SMS кода
    func setSMSCode(value: String) {
        interactor.setSMSCodeValue(request: AuthBySMSCode.SetPhoneNumberValue.Request(value: value))
    }
    
    // MARK: Продолжить
    func submit() {
        startFullScreenAnimatingIndicator()
        interactor.submit(request: AuthBySMSCode.Submit.Request())
    }
}
