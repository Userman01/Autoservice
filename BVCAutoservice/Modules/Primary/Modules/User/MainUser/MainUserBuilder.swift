//
//  MainUser module
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

final class MainUserBuilder {

    func build() -> MainUserViewController {
        let presenter = MainUserPresenter()
        let interactor = MainUserInteractor(presenter: presenter)
        let controller = MainUserViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}