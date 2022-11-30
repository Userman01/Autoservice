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
}

protocol AuthBySMSCodeViewControllerDelegate: AnyObject {
    /// Установка значения номера телефона
    func setPhoneNumber(value: String)
    
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
    
    init(interactor: AuthBySMSCodeBusinessLogic, out: @escaping AuthBySMSCodeOut) {
        self.interactor = interactor
        self.out = out
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
        getScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }

    private func getScreen() {
        interactor.getScreen(request: AuthBySMSCode.GetScreens.Request())
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
}

extension AuthBySMSCodeViewController: AuthBySMSCodeViewControllerDelegate {
    
    // MARK: Установка значения номера телефона
    func setPhoneNumber(value: String) {
        interactor.setPhoneNumberValue(request: AuthBySMSCode.SetPhoneNumberValue.Request(value: value))
    }
    
    // MARK: Продолжить
    func submit() {
        interactor.submit(request: AuthBySMSCode.Submit.Request())
    }
}
