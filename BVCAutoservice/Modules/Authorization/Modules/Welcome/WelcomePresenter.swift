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
        let viewModel = getViewModel(response)
        viewController?.displayFields(viewModel: Welcome.GetFields.ViewModel(result: viewModel))
    }
}

extension WelcomePresenter {

    private func getViewModel(_ response: Welcome.GetFields.Response) -> WelcomeViewModel {
        let viewModel: WelcomeViewModel
        let buttonTitle: String
        if response.role == UserRoleType.user.rawValue {
            buttonTitle = R.string.localizable.welcomeUserButtonTitle()
        } else {
            buttonTitle = R.string.localizable.welcomeServiceButtonTitle()
        }
        switch response.mode {
        case .registration:
            viewModel = WelcomeViewModel(userName: response.userName, title: R.string.localizable.commonRegistration(), buttonTitle: buttonTitle, describe: R.string.localizable.welcomeCommonDescribeRegitration())
        case .recovery:
            viewModel = WelcomeViewModel(userName: response.userName, title: R.string.localizable.commonRecovery(), buttonTitle: buttonTitle, describe: R.string.localizable.welcomeCommonDescribeRecovery())
        case .enter:
            viewModel = WelcomeViewModel(userName: response.userName, title: R.string.localizable.commonAuthorization(), buttonTitle: buttonTitle, describe: R.string.localizable.welcomeCommonDescribeEnter())
        }
        return viewModel
    }
}
