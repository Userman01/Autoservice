//
//  Main module
//  Created by postnikov_pp on 05/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainPresentationLogic {

    // Показ полей
    func presentFields(response: Main.GetFields.Response)
}

final class MainPresenter: MainPresentationLogic {

    weak var viewController: MainDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: Main.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: Main.GetFields.ViewModel(result: viewModel))
    }
}

extension MainPresenter {

    private func getViewModel() -> MainViewModel {
        MainViewModel()
    }
}