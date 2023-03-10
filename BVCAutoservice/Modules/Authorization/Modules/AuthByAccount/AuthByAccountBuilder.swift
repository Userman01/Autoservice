//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

final class AuthByAccountBuilder {

    func build(out: @escaping AuthByAccountOut) -> AuthByAccountViewController {
        let presenter = AuthByAccountPresenter()
        let interactor = AuthByAccountInteractor(presenter: presenter)
        let controller = AuthByAccountViewController(interactor: interactor, out: out)
        presenter.viewController = controller
        return controller
    }
}
