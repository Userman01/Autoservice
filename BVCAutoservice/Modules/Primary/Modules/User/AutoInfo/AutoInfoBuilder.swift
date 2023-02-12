//
//  AutoInfo module
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

final class AutoInfoBuilder {

    func build() -> AutoInfoViewController {
        let presenter = AutoInfoPresenter()
        let interactor = AutoInfoInteractor(presenter: presenter)
        let controller = AutoInfoViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}