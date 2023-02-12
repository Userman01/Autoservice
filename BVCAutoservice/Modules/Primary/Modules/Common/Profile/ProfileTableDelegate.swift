//
//  Profile module
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class ProfileTableDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: ProfileViewControllerDelegate?
    
    var representableViewModels: [ProfileCellViewModel]
    
    init(viewModels: [ProfileCellViewModel] = []) {
        representableViewModels = viewModels
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let viewModel = representableViewModels[safe: indexPath.row] else { return UITableView.automaticDimension }
        switch viewModel.cellType {
        case .spacer:
            return tableView.getSpacerHeight()
        case .empty:
            return .spacing20Pt
        default:
            return UITableView.automaticDimension
        }
    }
}
