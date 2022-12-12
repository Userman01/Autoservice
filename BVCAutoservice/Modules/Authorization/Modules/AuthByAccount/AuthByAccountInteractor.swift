//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//
import LocalAuthentication
import UIKit

protocol AuthByAccountBusinessLogic {

    // Получение полей
    func getFields(request: AuthByAccount.GetFields.Request)
    
    /// Установка значения номера телефона
    func setName(request: AuthByAccount.SetName.Request)
    
    /// Установка значения нового паспорта
    func setNewPassport(request: AuthByAccount.SetNewPassport.Request)
    
    /// Продолжить
    func submit(request: AuthByAccount.Submit.Request)
    
    /// Проверка биометрии
    func biometricAuth(request: AuthByAccount.BiometricAuth.Request)
    
    /// Проверка ранней установки
    func checkLaunchedBefore(request: AuthByAccount.CheckLaunchedBefore.Request)
}

final class AuthByAccountInteractor: AuthByAccountBusinessLogic {

    private let provider: AuthByAccountProviderProtocol
    private let presenter: AuthByAccountPresentationLogic
    
    private var name: String = ""
    private var passwort: String = ""
    private var isEnabledButton: Bool = false
    private var accessToken: String?
    private var pinCodeButtonType: PinCodeButtonType?
    
    init(provider: AuthByAccountProviderProtocol = AuthByAccountProvider(),
         presenter: AuthByAccountPresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: AuthByAccount.GetFields.Request) {
        checkBiometrics()
        presenter.presentFields(response: AuthByAccount.GetFields.Response())
        accessToken = provider.getToken()
    }
    
    // MARK: Установка значения номера телефона
    func setName(request: AuthByAccount.SetName.Request) {
        name = request.value
        setButtonState()
    }
    
    // MARK: Установка значения нового паспорта
    func setNewPassport(request: AuthByAccount.SetNewPassport.Request) {
        passwort = request.value
        setButtonState()
    }
    
    // MARK: Продолжить
    func submit(request: AuthByAccount.Submit.Request) {
        provider.fetchResultSendUserInfo(userName: name, password: passwort) { [weak self] result in
            switch result {
            case .success:
                self?.presenter.presentSubmit(responce: AuthByAccount.Submit.Response())
            case let .failure(message):
                self?.presenter.presentError(responce: AuthByAccount.Error.Response(errorMessage: message.errorMessage))
            }
        }
    }
    
    // MARK: Проверка биометрии
    func biometricAuth(request: AuthByAccount.BiometricAuth.Request) {
        guard let pinCodeButtonType = pinCodeButtonType else { return }
        let reason = R.string.localizable.authByAccountTouchID()
        let biometricAuthContext: LAContext = LAContext()
        biometricAuthContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, _ in
            guard let strongSelf = self else { return }
            if success {
                DispatchQueue.main.async {
                    strongSelf.presenter.presentBiometricAuth(response: AuthByAccount.BiometricAuth.Response())
                }
            } else {
                strongSelf.checkBiometrics()
                strongSelf.presenter.setBiometricAuth(response: AuthByAccount.SetBiometricAuth.Response(pinCodeButtonType: pinCodeButtonType))
            }
            strongSelf.inactivityLogoutTimerReset()
        }
    }
    
    // MARK: Проверка ранней установки
    func checkLaunchedBefore(request: AuthByAccount.CheckLaunchedBefore.Request) {
        let isLaunchedBefore: Bool = provider.checkIsLaunchedBefore()
        presenter.presentCheckLaunchedBefore(response: AuthByAccount.CheckLaunchedBefore.Response(isLaunchedBefore: isLaunchedBefore))
    }
}

extension AuthByAccountInteractor {
    
    private func setButtonState() {
        isEnabledButton = name.count > 0 && passwort.count > 0
        presenter.presentSetButtonState(response: AuthByAccount.SetButtonState.Response(isEnabledButton: isEnabledButton))
    }
    
    private func checkBiometrics() {
        let biometricAuthContext: LAContext = LAContext()
        if biometricAuthContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            switch biometricAuthContext.biometryType {
            case .faceID:
                pinCodeButtonType = .faceID
            case .touchID:
                pinCodeButtonType = .touchID
            default:
                pinCodeButtonType = PinCodeButtonType.none
            }
        } else {
            pinCodeButtonType = PinCodeButtonType.none
        }
    }
    
    // MARK: Сбросить таймер деавторизации при бездействии пользователя
    private func inactivityLogoutTimerReset() {
        DispatchQueue.main.async {
            UIApplication.shared.sendEvent(UIEvent())
        }
    }
}
