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
    
    func set(role: UserRoleType) -> PassportCreateBuilder {
        self.role = role
        return self
    }
    
    func set(phoneNumber: String?) -> PassportCreateBuilder {
        self.phoneNumber = phoneNumber
        return self
    }

    func build(out: @escaping PassportCreateOut) -> UIViewController {
        guard let role = role, let phoneNumber = phoneNumber else { fatalError("set role and phoneNumber") }
        let presenter = PassportCreatePresenter()
        let interactor = PassportCreateInteractor(presenter: presenter)
        let controller = PassportCreateViewController(interactor: interactor, userRole: role, phoneNumber: phoneNumber, out: out)
        presenter.viewController = controller
        return controller
    }
}
