//
//  Welcome module
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

final class WelcomeBuilder {
    
    private var mode: RegistrationMode?
    private var inModel: WelcomeInModel?

    func set(mode: RegistrationMode) -> WelcomeBuilder {
        self.mode = mode
        return self
    }
    
    func set(inModel: WelcomeInModel) -> WelcomeBuilder {
        self.inModel = inModel
        return self
    }
    
    func build(out: @escaping WelcomeOut) -> WelcomeViewController {
        guard let mode = mode else { fatalError("set mode")}
        let presenter = WelcomePresenter()
        let interactor = WelcomeInteractor(presenter: presenter)
        let controller = WelcomeViewController(interactor: interactor, mode: mode, inModel: inModel, out: out)
        presenter.viewController = controller
        return controller
    }
}
