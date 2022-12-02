//
//  AuthChoiceBuilder.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

final class RegistrationBuilder {
    
    func build(out: @escaping RegistrationOut) -> UIViewController {
        let presenter = RegistrationPresenter()
        let interactor = RegistrationInteractor(presenter: presenter)
        let controller = RegistrationViewController(interactor: interactor, out: out)
        presenter.viewController = controller
        return controller
    }
}
