//
//  AuthChoiceInteractor.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import Foundation

protocol RegistrationBusinessLogic {
    /// Запрос на получение экрана
    func getScreen(request: Registration.GetScreens.Request)
    
    /// Установка значения номера телефона
    func setPhoneNumberValue(request: Registration.SetPhoneNumberValue.Request)
    
    /// Продолжить
    func submit(request: Registration.Submit.Request)
}

final class RegistrationInteractor: RegistrationBusinessLogic {
    
    private let presenter: RegistrationPresentationLogic
    private let provider: RegistrationProviderProtocol
    
    private var phoneNumber: String = ""
    private var isEnabledButton: Bool = false
    
    init(presenter: RegistrationPresentationLogic,
         provider: RegistrationProviderProtocol = RegistrationProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Запрос на получение экрана
    func getScreen(request: Registration.GetScreens.Request) {
        presenter.presentScreen(responce: Registration.GetScreens.Responce())
    }
    
    // MARK: Установка значения номера телефона
    func setPhoneNumberValue(request: Registration.SetPhoneNumberValue.Request) {
        phoneNumber = request.value
        isEnabledButton = phoneNumber.count == 11
        presenter.presentSetButtonState(response: Registration.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
    
    // MARK: Продолжить
    func submit(request: Registration.Submit.Request) {
        provider.fetchResultSendPhoneNumber(phoneNumber: phoneNumber) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success:
                strongSelf.presenter.presentSubmit(responce: Registration.Submit.Response(phoneNumber: self?.phoneNumber))
            case let .failure(error):
               strongSelf.presenter.presentError(responce: Registration.Error.Response(errorMessage: error.errorMessage))
            }
        }
    }
}
