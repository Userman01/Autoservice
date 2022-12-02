//
//  AuthChoiceViewController.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

protocol PassportCreateDisplayLogic: AnyObject {
    /// Отображения экрана
    func displayScreen(viewModel: PassportCreate.GetScreens.ViewModel)
    
    /// Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: PassportCreate.SetButtonState.ViewModel)
}

protocol PassportCreateViewControllerDelegate: NSObject {
    
    /// Установка значения номера телефона
    func setName(value: String)
    
    /// Установка значения нового паспорта
    func setNewPassport(value: String)
    
    /// Установка значения повторного паспорта
    func setRepeatePassport(value: String)
    
    /// Продолжить
    func submit()
}

typealias PassportCreateOut = (PassportCreateOutCmd) -> Void
enum PassportCreateOutCmd {
    case open(PassportCreateNavigationType)
}

final class PassportCreateViewController: UIViewController {
    
    private let interactor: PassportCreateBusinessLogic
    
    private lazy var customView = self.view as? PassportCreateView
    
    private let out: PassportCreateOut
    private let userRole: UserRoleType
    private let phoneNumber: String
    
    init(interactor: PassportCreateBusinessLogic, userRole: UserRoleType, phoneNumber: String, out: @escaping PassportCreateOut) {
        self.interactor = interactor
        self.out = out
        self.userRole = userRole
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = PassportCreateView()
        self.view = view
        view.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScreen(userRole: userRole, phoneNumber: phoneNumber)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }
    
    private func getScreen(userRole: UserRoleType, phoneNumber: String) {
        interactor.getScreen(request: PassportCreate.GetScreens.Request(userRole: userRole, phoneNumber: phoneNumber))
    }
}

extension PassportCreateViewController: PassportCreateDisplayLogic {
    
    // MARK: Отображения экрана
    func displayScreen(viewModel: PassportCreate.GetScreens.ViewModel) {
        customView?.configure(viewModel: viewModel.result)
    }
    
    // MARK: Отображение установки состояния кнопки
    func displaySetButtonState(viewModel: PassportCreate.SetButtonState.ViewModel) {
        customView?.setButtonState(isEnabled: viewModel.isEnabledButton)
    }
}

extension PassportCreateViewController: PassportCreateViewControllerDelegate {
    
    // MARK: Установка значения номера телефона
    func setName(value: String) {
        interactor.setName(request: PassportCreate.SetName.Request(value: value))
    }
    
    // MARK: Установка значения нового паспорта
    func setNewPassport(value: String) {
        interactor.setNewPassport(request: PassportCreate.SetNewPassport.Request(value: value))
    }
    
    // MARK: Установка значения повторного паспорта
    func setRepeatePassport(value: String) {
        interactor.setRepeatePassport(request: PassportCreate.SetRepeatePassport.Request(value: value))
    }
    
    // MARK: Продолжить
    func submit() {
        interactor.submit(request: PassportCreate.Submit.Request())
    }
}
