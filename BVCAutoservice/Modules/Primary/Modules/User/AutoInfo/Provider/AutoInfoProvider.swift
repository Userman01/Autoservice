//
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol AutoInfoProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AutoInfoModel>) -> Void)
}

final class AutoInfoProvider: AutoInfoProviderProtocol {

    private let service: AutoInfoServiceProtocol

    init(service: AutoInfoServiceProtocol = AutoInfoService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<AutoInfoModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}