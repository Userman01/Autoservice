//
//  MainUser module
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainUserPresentationLogic {

    // Показ полей
    func presentFields(response: MainUser.GetFields.Response)
}

final class MainUserPresenter: MainUserPresentationLogic {

    weak var viewController: MainUserDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: MainUser.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: MainUser.GetFields.ViewModel(state: .result(viewModel)))
    }
}

extension MainUserPresenter {

    private func getViewModel() -> MainUserViewModel {
        MainUserViewModel(sections: [
            .menu([
                MainUserMenuViewModel(tittle: R.string.localizable.mainUserMenuTitleAutoService()),
                MainUserMenuViewModel(tittle: R.string.localizable.mainUserMenuTitleAutoWashing()),
                MainUserMenuViewModel(tittle: R.string.localizable.mainUserMenuTitleOilChange())
            ]),
            .services([
                MainUserServicesViewModel(
                    title: "Автосервис",
                    nameCityText: "Алматы",
                    image: R.image.logo()!,
                    infoText: "ыааываываыва ы а ыва ыв а ыва  ыва ы ва ы а ыв а ыва ы ва ыв а ыв а ыва ы ва ыв а ыва ыв а ыв а ыва ыв а ыва ыв а вы а ыва ыв а ы",
                countHeartText: "100",
                countChatText: "200"),
                MainUserServicesViewModel(
                    title: "Автосервис",
                    nameCityText: "Алматы",
                    image: R.image.logo()!,
                    infoText: "ыааываываыва ы а ыва ыв а ыва  ыва ы ва ы а ыв а ыва ы ва ыв а ыв а ыва ы ва ыв а ыва ыв а ыв а ыва ыв а ыва ыв а вы а ыва ыв а ы",
                    countHeartText: "10",
                    countChatText: "20")])]
        )
    }
}
