//
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol WelcomeServiceProtocol {
}

final class WelcomeService: WelcomeServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
}
