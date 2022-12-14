//
//  AuthChoiceInteractor.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol PassportCreateBusinessLogic {
    /// Запрос на получение экрана
    func getScreen(request: PassportCreate.GetScreens.Request)
    
    /// Установка значения номера телефона
    func setName(request: PassportCreate.SetName.Request)
    
    /// Установка значения нового паспорта
    func setNewPassport(request: PassportCreate.SetNewPassport.Request)
    
    /// Установка значения повторного паспорта
    func setRepeatePassport(request: PassportCreate.SetRepeatePassport.Request)
    
    /// Продолжить
    func submit(request: PassportCreate.Submit.Request)
}

final class PassportCreateInteractor: PassportCreateBusinessLogic {
    
    private let presenter: PassportCreatePresentationLogic
    private let provider: PassportCreateProviderProtocol
    
    private var name: String = ""
    private var newPassport: String = ""
    private var repeatePassport: String = ""
    private var userRole: UserRoleType? = .user
    private var phoneNumber: String = ""
    private var isEnabledButton: Bool = false
    private var mode: RegistrationMode = .registration
    private var username: String?
    private var SMSCode: String?
    
    init(presenter: PassportCreatePresentationLogic,
         provider: PassportCreateProviderProtocol = PassportCreateProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Запрос на получение экрана
    func getScreen(request: PassportCreate.GetScreens.Request) {
        userRole = request.userRole
        phoneNumber = request.phoneNumber
        mode = request.mode
        username = request.username
        SMSCode = request.SMSCode
        switch mode {
        case .registration:
            presenter.presentScreen(responce: PassportCreate.GetScreens.Responce(mode: mode, model: nil, username: nil))
        case .recovery:
            presenter.presentScreen(responce: PassportCreate.GetScreens.Responce(mode: mode, model: nil, username: username))
        default:
            break
        }
    }
    
    // MARK: Установка значения номера телефона
    func setName(request: PassportCreate.SetName.Request) {
        name = request.value
        setButtonState()
    }
    
    // MARK: Установка значения нового паспорта
    func setNewPassport(request: PassportCreate.SetNewPassport.Request) {
        newPassport = request.value
        setButtonState()
    }
    
    // MARK: Установка значения повторного паспорта
    func setRepeatePassport(request: PassportCreate.SetRepeatePassport.Request) {
        repeatePassport = request.value
        setButtonState()
    }
    
    // MARK: Продолжить
    func submit(request: PassportCreate.Submit.Request) {
        switch mode {
        case .registration:
            guard let userRole = userRole else { return }
            provider.fetchResultSendUserInfo(userName: name, phoneNumber: phoneNumber, role: userRole.rawValue, password: newPassport) { [weak self] result in
                switch result {
                case let .success(model):
                    self?.presenter.presentSubmit(responce: PassportCreate.Submit.Response())
                    self?.provider.setToken(model.accessToken)
                    self?.provider.setLogin(model.username)
                    self?.provider.setLaunchedBefore()
                    self?.provider.setRole(model.role)
                case let .failure(message):
                    self?.presenter.presentError(responce: PassportCreate.Error.Response(errorMessage: message.errorMessage))
                }
            }
        case .recovery:
            guard let userRole = userRole else { return }
            provider.fetchResultSendUserInfoRecovery(SMSCode: SMSCode, phoneNumber: phoneNumber, password: newPassport) { [weak self] result in
                switch result {
                case let .success(model):
                    self?.presenter.presentSubmit(responce: PassportCreate.Submit.Response())
                    self?.provider.setToken(model.accessToken)
                    self?.provider.setLogin(model.username)
                    self?.provider.setLaunchedBefore()
                    self?.provider.setRole(model.role)
                case let .failure(message):
                    self?.presenter.presentError(responce: PassportCreate.Error.Response(errorMessage: message.errorMessage))
                }
            }
        default:
            break
        }
    }
}

extension PassportCreateInteractor {
    
    private func setButtonState() {
        switch mode {
        case .registration:
            isEnabledButton = name.count > 0 && newPassport.count > 7 && newPassport == repeatePassport
            presenter.presentSetButtonState(response: PassportCreate.SetButtonState.Response(isEnabledButton: isEnabledButton))
        case .recovery:
            isEnabledButton = newPassport.count > 7 && newPassport == repeatePassport
            presenter.presentSetButtonState(response: PassportCreate.SetButtonState.Response(isEnabledButton: isEnabledButton))
        default:
            break
        }
        
    }
}
