//
//  Main module
//  Created by postnikov_pp on 05/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

final class MainBuilder {

    func build() -> MainViewController {
        let presenter = MainPresenter()
        let interactor = MainInteractor(presenter: presenter)
        let controller = MainViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}
