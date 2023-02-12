//
//  Profile module
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//
enum ProfileMode {
    case primary
}

final class ProfileBuilder {
    
    var mode: ProfileMode?
    
    func set(mode: ProfileMode) -> ProfileBuilder {
        self.mode = mode
        return self
    }

    func build() -> ProfileViewController {
        guard let mode = mode else { fatalError("You must set mode") }
        let presenter = ProfilePresenter()
        let interactor = ProfileInteractor(presenter: presenter, mode: mode)
        let controller = ProfileViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}
