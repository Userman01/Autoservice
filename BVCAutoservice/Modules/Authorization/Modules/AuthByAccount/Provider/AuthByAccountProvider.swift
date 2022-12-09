//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountProviderProtocol {
    /// Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, password: String?, completion: @escaping (RequestResult<AuthByAccountModel>) -> Void)
    
}

final class AuthByAccountProvider: AuthByAccountProviderProtocol {

    private let service: AuthByAccountServiceProtocol

    init(service: AuthByAccountServiceProtocol = AuthByAccountService()) {
        self.service = service
    }

    // MARK: Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, password: String?, completion: @escaping (RequestResult<AuthByAccountModel>) -> Void) {
        service.fetchResultSendUserInfo(userName: userName, password: password, completion: completion)
  }
}
