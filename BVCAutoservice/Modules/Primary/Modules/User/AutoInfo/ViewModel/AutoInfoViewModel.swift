//
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

struct AutoInfoViewModel {
    let cellType: [AutoInfoCellType]
    
    init(cellType: [AutoInfoCellType] = []) {
        self.cellType = cellType
    }
}

enum AutoInfoCellType {
    case empty
    case description(MainUserServicesViewModel)
    case services(AutoInfoServicesViewModel)
    case distance(AutoInfoDistanceViewModel)
    case reviews([AutoInfoReviewsViewModel])
    case button(ActionButtonCellViewModel)
}

struct AutoInfoServicesViewModel {
    let title: String
    let texts: [String]
    
    init(title: String = "", texts: [String] = []) {
        self.title = title
        self.texts = texts
    }
}

struct AutoInfoDistanceViewModel {
    let distance: String
}

struct AutoInfoReviewsViewModel {
    let title: String
    let description: String
}
