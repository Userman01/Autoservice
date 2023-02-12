//
//  Profile module
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

protocol ProfilePresentationLogic {

    // Показ полей
    func presentFields(response: Profile.GetFields.Response)
}

final class ProfilePresenter: ProfilePresentationLogic {
    
    private enum ViewMetrics {
        static let marginsButton = NSDirectionalEdgeInsets(
            top: .zero,
            leading: .spacing16Pt,
            bottom: .zero,
            trailing: .spacing16Pt)
        static let marginsSecondButton = NSDirectionalEdgeInsets(
            top: .spacing8Pt,
            leading: .spacing16Pt,
            bottom: .spacing8Pt,
            trailing: .spacing16Pt)
    }

    weak var viewController: ProfileDisplayLogic?

    // MARK: Показ полей
    func presentFields(response: Profile.GetFields.Response) {
        switch response.mode {
        case .primary:
            let viewModel = getViewModel()
            viewController?.displayFields(viewModel: Profile.GetFields.ViewModel(result: viewModel))
        }
    }
}

extension ProfilePresenter {

    private func getViewModel() -> ProfileViewModel {
        ProfileViewModel(
            title: "sd",
            description: "sd",
            cells: [
                ProfileCellViewModel(cellType: .empty),
                ProfileCellViewModel(cellType: .textField(
                    ProfileTextViewModel(title: "dfgdfg", label: "dfgdfgdfg", isEnabled: true))),
                ProfileCellViewModel(cellType: .textField(
                    ProfileTextViewModel(title: "dfgdfg", label: "dfgdfgdfg", isEnabled: true))),
                ProfileCellViewModel(cellType: .textField(
                    ProfileTextViewModel(title: "dfgdfg", label: "dfgdfgdfg", isEnabled: true))),
                ProfileCellViewModel(cellType: .textField(
                    ProfileTextViewModel(title: "dfgdfg", label: "dfgdfgdfg", isEnabled: true))),
                ProfileCellViewModel(cellType: .textField(
                    ProfileTextViewModel(title: "dfgdfg", label: "dfgdfgdfg", isEnabled: true))),
                ProfileCellViewModel(cellType: .button(ActionButtonCellViewModel(
                    buttonStyle: .second,
                    buttonTitle: "sdfsdfsdf",
                    margins: ViewMetrics.marginsSecondButton))),
                ProfileCellViewModel(cellType: .spacer),
                ProfileCellViewModel(cellType: .button(ActionButtonCellViewModel(
                    buttonStyle: .primary,
                    buttonTitle: "PUSH",
                    margins: ViewMetrics.marginsButton)))
            ])
    }
}
