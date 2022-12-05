//
//  Created by postnikov_pp on 05/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol MainProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MainModel>) -> Void)
}

final class MainProvider: MainProviderProtocol {

    private let service: MainServiceProtocol

    init(service: MainServiceProtocol = MainService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MainModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}