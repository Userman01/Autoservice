//
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainUserProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MainUserModel>) -> Void)
}

final class MainUserProvider: MainUserProviderProtocol {

    private let service: MainUserServiceProtocol

    init(service: MainUserServiceProtocol = MainUserService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MainUserModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}