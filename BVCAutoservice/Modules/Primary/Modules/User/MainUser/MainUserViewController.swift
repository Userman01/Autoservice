//
//  MainUser module
//
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

protocol MainUserDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: MainUser.GetFields.ViewModel)
}

protocol MainUserViewControllerDelegate: AnyObject {

}

final class MainUserViewController: UIViewController {

    private let interactor: MainUserBusinessLogic
    private let tableDataSource = MainUserTableDataSource()
    private let tableDelegate = MainUserTableDelegate()

    private lazy var customView = view as? MainUserView

    init(interactor: MainUserBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        tableDataSource.delegate = self
        tableDelegate.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = MainUserView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getFields()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }

    // MARK: Получение полей
    private func getFields() {
        interactor.getFields(request: MainUser.GetFields.Request())
    }
}

extension MainUserViewController: MainUserDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: MainUser.GetFields.ViewModel) {
        switch viewModel.state {
        case let .result(viewModel):
            tableDelegate.representableViewModels = viewModel
            tableDataSource.representableViewModel = viewModel
            customView?.updateTableView(dataSource: tableDataSource, delegate: tableDelegate)
        case let .error(message: message):
            alert(message: message)
        case .loading:
            print("loading")
        }
    }
}

extension MainUserViewController: MainUserViewControllerDelegate {

}
