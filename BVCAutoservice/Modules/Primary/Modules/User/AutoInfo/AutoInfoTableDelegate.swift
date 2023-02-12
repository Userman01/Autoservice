//
//  AutoInfo module
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class AutoInfoTableDelegate: NSObject, UITableViewDelegate {

    weak var delegate: AutoInfoViewControllerDelegate?

    var representableViewModels: AutoInfoViewModel

    init(viewModels: AutoInfoViewModel = AutoInfoViewModel()) {
        representableViewModels = viewModels
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let type = representableViewModels.cellType[safe: indexPath.row] else { return .zero }
        switch type {
        case .reviews:
            return 254.0
        case .empty:
            return .spacing24Pt
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
