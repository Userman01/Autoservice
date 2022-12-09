//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

protocol AuthByAccountServiceProtocol {

    // Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, password: String?, completion: @escaping (RequestResult<AuthByAccountModel>) -> Void)
}

final class AuthByAccountService: AuthByAccountServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: Отправка данных пользователя
    func fetchResultSendUserInfo(userName: String?, password: String?, completion: @escaping (RequestResult<AuthByAccountModel>) -> Void) {
        let url = AuthorizationEndpoints.signUp
        let parameters: [String: Any] = [
            "username": userName ?? "",
            "password": password ?? ""
        ]
        apiClient.post(url, parameters: parameters, model: AuthByAccountModel.self, completion: completion)
  }
}
