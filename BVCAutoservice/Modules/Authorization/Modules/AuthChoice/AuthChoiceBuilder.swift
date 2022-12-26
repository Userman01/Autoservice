//
//  AuthChoiceBuilder.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

final class AuthChoiceBuilder {
    
    func build(out: @escaping AuthChoiceOut) -> UIViewController {
        let presenter = AuthChoicePresenter()
        let interactor = AuthChoiceInteractor(presenter: presenter)
        let controller = AuthChoiceViewController(interactor: interactor, out: out)
        presenter.viewController = controller
        return controller
    }
}
