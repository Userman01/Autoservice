//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountServiceProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AuthByAccountModel>) -> Void)
}

final class AuthByAccountService: AuthByAccountServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AuthByAccountModel>) -> Void) {
        let url = ""
        apiClient.post(url, parameters: params, model: AuthByAccountModel.self, completion: completion)
    }
}