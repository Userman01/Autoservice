//
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

struct ProfileViewModel {
    let title: String
    let description: String
    let cells: [ProfileCellViewModel]
}

struct ProfileCellViewModel {
    let cellType: ProfileCellType
}

enum ProfileCellType {
    case textField(ProfileTextViewModel)
    case button(ActionButtonCellViewModel)
    case spacer
    case empty
}

struct ProfileTextViewModel {
    let title: String
    let label: String
    let isEnabled: Bool
}
