//
//  MainUser module
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

final class MainUserTableDelegate: NSObject, UITableViewDelegate {

    weak var delegate: MainUserViewControllerDelegate?

    var representableViewModels: MainUserViewModel

    init(viewModels: MainUserViewModel = MainUserViewModel()) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat.spacing80Pt
        case 1:
            return tableView.frame.height - CGFloat.spacing80Pt
        default:
            return UITableView.automaticDimension
        }
    }
}
