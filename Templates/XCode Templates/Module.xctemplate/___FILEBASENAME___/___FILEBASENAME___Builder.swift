//  ___FILEHEADER___

final class ___VARIABLE_productName:identifier___Builder {

    func build() -> ___VARIABLE_productName:identifier___ViewController {
        let presenter = ___VARIABLE_productName:identifier___Presenter()
        let interactor = ___VARIABLE_productName:identifier___Interactor(presenter: presenter)
        let controller = ___VARIABLE_productName:identifier___ViewController(interactor: interactor)
        presenter.viewController = controller
        return controller
    }
}