//
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol WelcomeProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<WelcomeModel>) -> Void)
}

final class WelcomeProvider: WelcomeProviderProtocol {

    private let service: WelcomeServiceProtocol

    init(service: WelcomeServiceProtocol = WelcomeService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<WelcomeModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}