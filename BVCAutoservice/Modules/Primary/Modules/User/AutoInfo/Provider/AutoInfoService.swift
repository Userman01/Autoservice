//
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol AutoInfoServiceProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AutoInfoModel>) -> Void)
}

final class AutoInfoService: AutoInfoServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AutoInfoModel>) -> Void) {
        let url = ""
        apiClient.post(url, parameters: params, model: AutoInfoModel.self, completion: completion)
    }
}