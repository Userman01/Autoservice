//
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol ProfileProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<ProfileModel>) -> Void)
}

final class ProfileProvider: ProfileProviderProtocol {

    private let service: ProfileServiceProtocol

    init(service: ProfileServiceProtocol = ProfileService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<ProfileModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}