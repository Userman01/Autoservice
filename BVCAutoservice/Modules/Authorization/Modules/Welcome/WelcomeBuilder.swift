//
//  Welcome module
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

final class WelcomeBuilder {

    func build() -> WelcomeViewController {
        let presenter = WelcomePresenter()
        let interactor = WelcomeInteractor(presenter: presenter)
        let controller = WelcomeViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}
