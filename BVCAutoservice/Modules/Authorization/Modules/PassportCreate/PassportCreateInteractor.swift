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
    private var userRole: UserRoleType = .user
    private var phoneNumber: String = ""
    private var isEnabledButton: Bool = false
    
    init(presenter: PassportCreatePresentationLogic,
         provider: PassportCreateProviderProtocol = PassportCreateProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Запрос на получение экрана
    func getScreen(request: PassportCreate.GetScreens.Request) {
        userRole = request.userRole
        phoneNumber = request.phoneNumber
        presenter.presentScreen(responce: PassportCreate.GetScreens.Responce())
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
        provider.fetchResultSendUserInfo(userName: name, phoneNumber: phoneNumber, role: userRole.rawValue, password: newPassport) { [weak self] result in
            switch result {
            case .success:
                self?.presenter.presentSubmit(responce: PassportCreate.Submit.Response())
            case let .failure(message):
                self?.presenter.presentError(responce: PassportCreate.Error.Response(errorMessage: message.errorMessage))
            }
        }
    }
}

extension PassportCreateInteractor {
    
    private func setButtonState() {
        isEnabledButton = name.count > 0 && newPassport.count > 7 && newPassport == repeatePassport
        presenter.presentSetButtonState(response: PassportCreate.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
}
