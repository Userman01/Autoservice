//
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

struct MainUserViewModel {
    let sections: [MainUserSectionType]
    
    init(sections: [MainUserSectionType] = []) {
        self.sections = sections
    }
}

enum MainUserSectionType {
    case menu([MainUserMenuViewModel])
    case services([MainUserServicesViewModel])
}

struct MainUserMenuViewModel {
    let tittle: String
}

struct MainUserServicesViewModel {
    let title: String
    let nameCityText: String
    let image: UIImage
    let infoText: String
}
