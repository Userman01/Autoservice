//
//  AutoInfo module
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class AutoInfoTableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: AutoInfoViewControllerDelegate?

    var representableViewModels: AutoInfoViewModel

    init(viewModels: AutoInfoViewModel = AutoInfoViewModel()) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        representableViewModels.cellType.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = representableViewModels.cellType[safe: indexPath.row] else { return UITableViewCell() }
        switch type {
        case .empty:
            let cell = tableView.dequeueReusableCellWithRegistration(type: SpacerCell.self, indexPath: indexPath)
            return cell
        case let .description(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: AutoInfoDescriptionCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .services(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: AutoInfoServicesCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .distance(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: AutoInfoDistanceCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .reviews(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: AutoInfoReviewsCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case let .button(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: ActionButtonCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        }
    }
}
