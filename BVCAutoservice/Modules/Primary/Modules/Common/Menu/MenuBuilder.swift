//
//  Menu module
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

final class MenuBuilder {

    func build() -> MenuViewController {
        let presenter = MenuPresenter()
        let interactor = MenuInteractor(presenter: presenter)
        let controller = MenuViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}