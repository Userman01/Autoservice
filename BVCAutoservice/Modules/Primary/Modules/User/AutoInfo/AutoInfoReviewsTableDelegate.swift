//
//  AutoInfoReviewsTableDelegate.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit

final class AutoInfoReviewsTableDelegate: NSObject, UITableViewDelegate {

    weak var delegate: AutoInfoViewControllerDelegate?

    var representableViewModels: [AutoInfoReviewsViewModel]

    init(viewModels: [AutoInfoReviewsViewModel] = []) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
