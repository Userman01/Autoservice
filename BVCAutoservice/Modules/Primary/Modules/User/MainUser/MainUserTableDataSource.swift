//
//  MainUser module
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

final class MainUserTableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModel: MainUserViewModel

    init(viewModel: MainUserViewModel = MainUserViewModel()) {
        representableViewModel = viewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        representableViewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let type = representableViewModel.sections[safe: section] else { return 0 }
        switch type {
        case .menu:
            return 1
        case .services:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let type = representableViewModel.sections[safe: indexPath.section] else { return UITableViewCell() }
        switch type {
        case let .services(sectionViewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: MainUserServiceCell.self, indexPath: indexPath)
            cell.configure(with: sectionViewModel)
            return cell
        case let .menu(sectionViewModel):
            let cell = tableView.dequeueReusableCellWithRegistration(type: MainUserMenuCell.self, indexPath: indexPath)
            cell.configure(with: sectionViewModel)
            return cell
        }
    }
}
