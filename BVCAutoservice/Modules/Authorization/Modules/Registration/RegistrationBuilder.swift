//
//  AuthChoiceBuilder.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

final class RegistrationBuilder {
    
    var mode: RegistrationMode = .registration
    
    func set(mode: RegistrationMode) -> RegistrationBuilder {
        self.mode = mode
        return self
    }
    
    func build(out: @escaping RegistrationOut) -> UIViewController {
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor(presenter: presenter)
        let controller = RegistrationViewController(interactor: interactor, mode: mode, out: out)
        presenter.viewController = controller
        return controller
    }
}
