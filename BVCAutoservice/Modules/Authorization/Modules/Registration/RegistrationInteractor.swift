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
    
    /// Установка мода
    func setMode(request: Registration.Mode.Request)
}

final class RegistrationInteractor: RegistrationBusinessLogic {
    
    private let presenter: RegistrationPresentationLogic
    private let provider: RegistrationProviderProtocol
    
    private var phoneNumber: String = ""
    private var phoneNumberWithoutSymbol: String = ""
    private var isEnabledButton: Bool = false
    private let allowedChars = "0123456789"
    private var mode: RegistrationMode = .registration
    
    init(presenter: RegistrationPresentationLogic,
         provider: RegistrationProviderProtocol = RegistrationProvider()) {
        self.presenter = presenter
        self.provider = provider
    }
    
    // MARK: Запрос на получение экрана
    func getScreen(request: Registration.GetScreens.Request) {
        presenter.presentScreen(responce: Registration.GetScreens.Responce(mode: mode))
    }
    
    // MARK: Установка значения номера телефона
    func setPhoneNumberValue(request: Registration.SetPhoneNumberValue.Request) {
        phoneNumber = request.value
        phoneNumberWithoutSymbol = removeNotAllowedChars(in: phoneNumber) ?? ""
        isEnabledButton = phoneNumberWithoutSymbol.count == 11
        presenter.presentSetButtonState(response: Registration.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
    
    // MARK: Продолжить
    func submit(request: Registration.Submit.Request) {
        switch mode {
        case .registration:
            provider.fetchResultSendPhoneNumber(phoneNumber: phoneNumberWithoutSymbol) { [weak self] result in
                guard let strongSelf = self else { return }
                switch result {
                case .success:
                    strongSelf.presenter.presentSubmit(responce: Registration.Submit.Response(phoneNumber: self?.phoneNumberWithoutSymbol, mode: self?.mode ?? .registration))
                case let .failure(error):
                   strongSelf.presenter.presentError(responce: Registration.Error.Response(errorMessage: error.errorMessage))
                }
            }
        case .recovery:
            provider.fetchResultSendPhoneNumberRecovery(phoneNumber: phoneNumberWithoutSymbol) { [weak self] result in
                guard let strongSelf = self else { return }
                switch result {
                case .success:
                    strongSelf.presenter.presentSubmit(responce: Registration.Submit.Response(phoneNumber: self?.phoneNumberWithoutSymbol, mode: self?.mode ?? .recovery))
                case let .failure(error):
                   strongSelf.presenter.presentError(responce: Registration.Error.Response(errorMessage: error.errorMessage))
                }
            }
        }
    }
    
    // MARK: Установка мода
    func setMode(request: Registration.Mode.Request) {
        self.mode = request.mode
    }
}
extension RegistrationInteractor {
    
    private func removeNotAllowedChars(in string: String?) -> String? {
            string?.filter { allowedChars.contains($0) }
        }
}
