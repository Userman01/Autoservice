//  ___FILEHEADER___

protocol ___VARIABLE_productName:identifier___BusinessLogic {

    // Получение полей
    func getFields(request: ___VARIABLE_productName:identifier___.GetFields.Request)
}

final class ___VARIABLE_productName:identifier___Interactor: ___VARIABLE_productName:identifier___BusinessLogic {

    private let provider: ___VARIABLE_productName:identifier___ProviderProtocol
    private let presenter: ___VARIABLE_productName:identifier___PresentationLogic

    init(provider: ___VARIABLE_productName:identifier___ProviderProtocol = ___VARIABLE_productName:identifier___Provider(),
         presenter: ___VARIABLE_productName:identifier___PresentationLogic) {
        self.provider = provider
        self.presenter = presenter
    }

    // MARK: Получение полей
    func getFields(request: ___VARIABLE_productName:identifier___.GetFields.Request) {
        provider.fetchFields(params: [:]) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(model):
                print(model)
                strongSelf.presenter.presentFields(response: ___VARIABLE_productName:identifier___.GetFields.Response())
            case let .failure(error):
                print(error.errorMessage)
            }
        }
    }
}