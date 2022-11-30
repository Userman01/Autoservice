//
//  AuthChoiceBuilder.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

final class RegistrationBuilder {
    
    private var userRoleType: UserRoleType?
    
    func set(userRoleType: UserRoleType?) -> RegistrationBuilder {
        self.userRoleType = userRoleType
        return self
    }
    
    func build(out: @escaping RegistrationOut) -> UIViewController {
        guard let userRoleType = userRoleType else { fatalError("set model") }
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor(presenter: presenter)
        let controller = RegistrationViewController(interactor: interactor, out: out, userRoleType: userRoleType)
        presenter.viewController = controller
        return controller
    }
}
