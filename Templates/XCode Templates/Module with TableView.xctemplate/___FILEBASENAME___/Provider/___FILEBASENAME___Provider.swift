//  ___FILEHEADER___

protocol ___VARIABLE_productName:identifier___ProviderProtocol {

    // Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<___VARIABLE_productName:identifier___Model>) -> Void)
}

final class ___VARIABLE_productName:identifier___Provider: ___VARIABLE_productName:identifier___ProviderProtocol {

    private let service: ___VARIABLE_productName:identifier___ServiceProtocol

    init(service: ___VARIABLE_productName:identifier___ServiceProtocol = ___VARIABLE_productName:identifier___Service()) {
        self.service = service
    }

    // MARK: Получение полей
    // https://wiki.albank.ru
    func fetchFields(params: [String: Any], completion: @escaping (RequestResult<___VARIABLE_productName:identifier___Model>) -> Void) {
        service.fetchFields(params: params, completion: completion)
    }
}