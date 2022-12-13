//
//  Welcome module
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol WelcomePresentationLogic {

    // Показ полей
    func presentFields(response: Welcome.GetFields.Response)
}

final class WelcomePresenter: WelcomePresentationLogic {

    weak var viewController: WelcomeDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: Welcome.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: Welcome.GetFields.ViewModel(result: viewModel))
    }
}

extension WelcomePresenter {

    private func getViewModel() -> WelcomeViewModel {
        WelcomeViewModel()
    }
}