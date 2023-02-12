//
//  AutoInfo module
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

protocol AutoInfoPresentationLogic {

    // Показ полей
    func presentFields(response: AutoInfo.GetFields.Response)
}

final class AutoInfoPresenter: AutoInfoPresentationLogic {
    
    private enum ViewMetrics {
        static let marginsButton = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .spacing16Pt,
            bottom: .zero,
            trailing: .spacing16Pt)
        
    }

    weak var viewController: AutoInfoDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: AutoInfo.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: AutoInfo.GetFields.ViewModel(result: viewModel))
    }
}

extension AutoInfoPresenter {

    private func getViewModel() -> AutoInfoViewModel {
        AutoInfoViewModel(cellType: [
            .empty,
            .description(MainUserServicesViewModel(
                title: "Автосервис",
                nameCityText: "Алматы",
                image: R.image.mocAutoservice()!,
                infoText: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim.",
                countHeartText: "100",
                countChatText: "234")),
            .services(AutoInfoServicesViewModel(
                title: "service",
                texts: [
                "капитальный ремонт ДВС", "ремонт ходовой", "ремонт АККП", "lorem ipsun", "lorem ipsun", "lorem ipsun", "lorem ipsun", "lorem ipsun"
                ])),
            .distance(AutoInfoDistanceViewModel(distance: "12 km")),
            .reviews([
                AutoInfoReviewsViewModel(
                    title: "sdfsdfsdf",
                    description: "sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf"),
                AutoInfoReviewsViewModel(
                    title: "sdfsdfsdf",
                    description: "sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf"),
                AutoInfoReviewsViewModel(
                    title: "sdfsdfsdf",
                    description: "sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf"),
                AutoInfoReviewsViewModel(
                    title: "sdfsdfsdf",
                    description: "sdfsdf sdfsdf sfsdfsd sdfsdf sdfsdf")]
                    ),
            .button(ActionButtonCellViewModel(
                buttonStyle: .primary,
                buttonTitle: "Забронировать бокс",
                margins: ViewMetrics.marginsButton))
        ])
    }
}
