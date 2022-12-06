//
//  AuthByAccount module
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountPresentationLogic {

    // Показ полей
    func presentFields(response: AuthByAccount.GetFields.Response)
}

final class AuthByAccountPresenter: AuthByAccountPresentationLogic {

    weak var viewController: AuthByAccountDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: AuthByAccount.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: AuthByAccount.GetFields.ViewModel(result: viewModel))
    }
}

extension AuthByAccountPresenter {

    private func getViewModel() -> AuthByAccountViewModel {
        AuthByAccountViewModel(isEnabled: false)
    }
}
