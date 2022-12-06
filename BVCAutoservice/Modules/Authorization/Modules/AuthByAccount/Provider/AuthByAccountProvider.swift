//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AuthByAccountModel>) -> Void)
}

final class AuthByAccountProvider: AuthByAccountProviderProtocol {

    private let service: AuthByAccountServiceProtocol

    init(service: AuthByAccountServiceProtocol = AuthByAccountService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AuthByAccountModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}