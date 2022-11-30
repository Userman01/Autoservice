//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

import UIKit

final class AuthBySMSCodeBuilder {

    func build(out: @escaping AuthBySMSCodeOut ) -> UIViewController {
        let presenter = AuthBySMSCodePresenter()
        let interactor = AuthBySMSCodeInteractor(presenter: presenter)
        let controller = AuthBySMSCodeViewController(interactor: interactor, out: out)

        presenter.viewController = controller
        return controller
    }
}
