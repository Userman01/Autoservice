//
//  Menu module
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol MenuPresentationLogic {

    // Показ полей
    func presentFields(response: Menu.GetFields.Response)
}

final class MenuPresenter: MenuPresentationLogic {

    weak var viewController: MenuDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: Menu.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: Menu.GetFields.ViewModel(result: viewModel))
    }
}

extension MenuPresenter {

    private func getViewModel() -> [MenuViewModel] {
        let viewModels = [
            MenuViewModel(cellType: .spacer),
            MenuViewModel(cellType: .text(MenuTextViewModel(title: R.string.localizable.menuUserHome()))),
            MenuViewModel(cellType: .text(MenuTextViewModel(title: R.string.localizable.menuUserPersonalArea()))),
            MenuViewModel(cellType: .text(MenuTextViewModel(title: R.string.localizable.menuUserNotification()))),
            MenuViewModel(cellType: .text(MenuTextViewModel(title: R.string.localizable.menuUserConfigure()))),
            MenuViewModel(cellType: .text(MenuTextViewModel(title: R.string.localizable.menuUserHelp()))),
            MenuViewModel(cellType: .text(MenuTextViewModel(title: R.string.localizable.menuUserApplications()))),
            MenuViewModel(cellType: .contacts)
        ]
        return viewModels
    }
}
