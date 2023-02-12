//
//  AutoInfoReviewsTableDataSource.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit

final class AutoInfoReviewsTableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: AutoInfoViewControllerDelegate?

    var representableViewModels: [AutoInfoReviewsViewModel]

    init(viewModels: [AutoInfoReviewsViewModel] = []) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        representableViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = representableViewModels[safe: indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCellWithRegistration(type: AutoInfoReviewPersonCell.self, indexPath: indexPath)
        cell.configure(with: viewModel)
        return cell
        
    }
}

