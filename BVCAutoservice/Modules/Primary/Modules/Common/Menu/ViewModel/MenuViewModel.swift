//
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

struct MenuViewModel {
    let cellType: MenuCellType
}

enum MenuCellType {
    case spacer
    case text(MenuTextViewModel)
    case contacts
}

struct MenuTextViewModel {
    let title: String
}
