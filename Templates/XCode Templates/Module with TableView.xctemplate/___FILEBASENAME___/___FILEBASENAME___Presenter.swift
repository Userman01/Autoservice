//  ___FILEHEADER___

protocol ___VARIABLE_productName:identifier___PresentationLogic {

    // Показ полей
    func presentFields(response: ___VARIABLE_productName:identifier___.GetFields.Response)
}

final class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___PresentationLogic {

    weak var viewController: ___VARIABLE_productName:identifier___DisplayLogic?

    // MARK: Показ полей
    func presentFields(response: ___VARIABLE_productName:identifier___.GetFields.Response) {
        let viewModel = getViewModel()
        viewController?.displayFields(viewModel: ___VARIABLE_productName:identifier___.GetFields.ViewModel(result: viewModel))
    }
}

extension ___VARIABLE_productName:identifier___Presenter {

    private func getViewModel() -> ___VARIABLE_productName:identifier___ViewModel {
        ___VARIABLE_productName:identifier___ViewModel()
    }
}