//
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol ProfileServiceProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<ProfileModel>) -> Void)
}

final class ProfileService: ProfileServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<ProfileModel>) -> Void) {
        let url = ""
        apiClient.post(url, parameters: params, model: ProfileModel.self, completion: completion)
    }
}