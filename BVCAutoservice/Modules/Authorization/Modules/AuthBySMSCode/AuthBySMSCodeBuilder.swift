//
//  AuthBySMSCode module
//  Created by postnikov_pp on 30/11/2022.
//

import UIKit

final class AuthBySMSCodeBuilder {
    
    private var viewModel: AuthBySMSCodeTypeViewModel?
    
    func set(viewModel: AuthBySMSCodeTypeViewModel) -> AuthBySMSCodeBuilder {
        self.viewModel = viewModel
        return self
    }

    func build(out: @escaping AuthBySMSCodeOut ) -> UIViewController {
        guard let viewModel = viewModel else { fatalError("set viewModel") }
        let presenter = AuthBySMSCodePresenter()
        let interactor = AuthBySMSCodeInteractor(presenter: presenter)
        let controller = AuthBySMSCodeViewController(interactor: interactor, viewModel: viewModel, out: out)

        presenter.viewController = controller
        return controller
    }
}
