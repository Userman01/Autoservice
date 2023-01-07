//
//  Menu module
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class MenuTableDelegate: NSObject, UITableViewDelegate {

    weak var delegate: MenuViewControllerDelegate?

    var representableViewModels: [MenuViewModel]

    init(viewModels: [MenuViewModel] = []) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tup delegate")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let type = representableViewModels[safe: indexPath.row] else { return .zero }
        switch type.cellType {
        case .spacer:
            return .spacing120Pt
        case .contacts:
            return .spacing160Pt
        default:
            return UITableView.automaticDimension
        }
    }
}
