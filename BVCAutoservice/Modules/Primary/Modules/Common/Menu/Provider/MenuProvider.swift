//
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

protocol MenuProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MenuModel>) -> Void)
}

final class MenuProvider: MenuProviderProtocol {

    private let service: MenuServiceProtocol

    init(service: MenuServiceProtocol = MenuService()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<MenuModel>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}