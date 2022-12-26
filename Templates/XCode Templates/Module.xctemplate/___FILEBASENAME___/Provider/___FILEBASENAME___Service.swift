//  ___FILEHEADER___

protocol ___VARIABLE_productName:identifier___ServiceProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<___VARIABLE_productName:identifier___Model>) -> Void)
}

final class ___VARIABLE_productName:identifier___Service: ___VARIABLE_productName:identifier___ServiceProtocol {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<___VARIABLE_productName:identifier___Model>) -> Void) {
        let url = ""
        apiClient.post(url, parameters: params, model: ___VARIABLE_productName:identifier___Model.self, completion: completion)
    }
}