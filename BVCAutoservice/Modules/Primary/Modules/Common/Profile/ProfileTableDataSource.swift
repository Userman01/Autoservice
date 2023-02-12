//
//  Profile module
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class ProfileTableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: ProfileViewControllerDelegate?

    var representableViewModels: [ProfileCellViewModel]

    init(viewModels: [ProfileCellViewModel] = []) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        representableViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = representableViewModels[safe: indexPath.row] else { return UITableViewCell() }
        switch viewModel.cellType {
        case let .textField(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: ProfileTextFieldCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .button(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: ActionButtonCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case .spacer:
            let cell = tableView.dequeueReusableCellWithRegistration(type: SpacerCell.self, indexPath: indexPath)
            return cell
        case .empty:
            let cell = tableView.dequeueReusableCellWithRegistration(type: SpacerCell.self, indexPath: indexPath)
            return cell
        }
    }
}
