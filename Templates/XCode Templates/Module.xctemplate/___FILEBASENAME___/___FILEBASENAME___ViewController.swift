//  ___FILEHEADER___

import UIKit

protocol ___VARIABLE_productName:identifier___DisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: ___VARIABLE_productName:identifier___.GetFields.ViewModel)
}

protocol ___VARIABLE_productName:identifier___ViewControllerDelegate: AnyObject {

}

final class ___VARIABLE_productName:identifier___ViewController: UIViewController {

    private let interactor: ___VARIABLE_productName:identifier___BusinessLogic

    private lazy var customView = view as? ___VARIABLE_productName:identifier___View

    init(interactor: ___VARIABLE_productName:identifier___BusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = ___VARIABLE_productName:identifier___View(frame: UIScreen.main.bounds, delegate: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getFields()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.light)
    }

    // MARK: Получение полей
    private func getFields() {
        interactor.getFields(request: ___VARIABLE_productName:identifier___.GetFields.Request())
    }
}

extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___DisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: ___VARIABLE_productName:identifier___.GetFields.ViewModel) {
        customView?.configure(with: viewModel.result)
    }
}

extension ___VARIABLE_productName:identifier___ViewController: ___VARIABLE_productName:identifier___ViewControllerDelegate {

}