//
//  Menu module
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class MenuTableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: MenuViewControllerDelegate?

    var representableViewModels: [MenuViewModel]

    init(viewModels: [MenuViewModel] = []) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        representableViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = representableViewModels[safe: indexPath.row] else { return UITableViewCell() }
        switch type.cellType {
        case .spacer:
            let cell = tableView.dequeueReusableCellWithRegistration(type: SpacerCell.self, indexPath: indexPath)
            return cell
        case let .text(viewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: MenuTextCell.self, indexPath: indexPath)
            cell.configure(with: viewModel)
            return cell
        case .contacts:
            let cell = tableView.dequeueReusableCellWithRegistration(type: MenuContactsCell.self, indexPath: indexPath)
            cell.didTupInst = { [weak self] in
                self?.delegate?.didTupInstagram()
            }
            cell.didTupPhone = { [weak self] in
                self?.delegate?.didTupPhone()
            }
            cell.didTupFacebook = { [weak self] in
                self?.delegate?.didTupFacebook()
            }
            return cell
        }
    }
}
