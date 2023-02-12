//
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainUserServiceProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MainUserModel>) -> Void)
}

final class MainUserService: MainUserServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MainUserModel>) -> Void) {
        let url = ""
        apiClient.post(url, parameters: params, model: MainUserModel.self, completion: completion)
    }
}