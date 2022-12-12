//
//  AuthChoiceBuilder.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

final class PassportCreateBuilder {
    
    var role: UserRoleType?
    var phoneNumber: String?
    var mode: RegistrationMode = .registration
    var username: String?
    var SMSCode: String?
    
    func set(role: UserRoleType?) -> PassportCreateBuilder {
        self.role = role
        return self
    }
    
    func set(phoneNumber: String?) -> PassportCreateBuilder {
        self.phoneNumber = phoneNumber
        return self
    }
    
    func set(mode: RegistrationMode) -> PassportCreateBuilder {
        self.mode = mode
        return self
    }
    
    func set(username: String?) -> PassportCreateBuilder {
        self.username = username
        return self
    }
    
    func set(SMSCode: String?) -> PassportCreateBuilder {
        self.SMSCode = SMSCode
        return self
    }

    func build(out: @escaping PassportCreateOut) -> UIViewController {
        guard let phoneNumber = phoneNumber else { fatalError("set phoneNumber") }
        let presenter = PassportCreatePresenter()
        let interactor = PassportCreateInteractor(presenter: presenter)
        let controller = PassportCreateViewController(interactor: interactor, userRole: role, phoneNumber: phoneNumber, mode: mode, username: username, SMSCode: SMSCode, out: out)
        presenter.viewController = controller
        return controller
    }
}
