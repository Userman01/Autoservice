//
//  AutoInfo module
//
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

protocol AutoInfoDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: AutoInfo.GetFields.ViewModel)
}

protocol AutoInfoViewControllerDelegate: AnyObject {

}

final class AutoInfoViewController: UIViewController {

    private let interactor: AutoInfoBusinessLogic
    private let tableDataSource = AutoInfoTableDataSource()
    private let tableDelegate = AutoInfoTableDelegate()

    private lazy var customView = view as? AutoInfoView

    init(interactor: AutoInfoBusinessLogic) {
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
        view = AutoInfoView(frame: UIScreen.main.bounds, tableDataSource: tableDataSource, tableDelegate: tableDelegate)
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
        interactor.getFields(request: AutoInfo.GetFields.Request())
    }
}

extension AutoInfoViewController: AutoInfoDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: AutoInfo.GetFields.ViewModel) {
        tableDataSource.representableViewModels = viewModel.result
        tableDelegate.representableViewModels = viewModel.result
        customView?.updateTableView(dataSource: tableDataSource, delegate: tableDelegate)
    }
}

extension AutoInfoViewController: AutoInfoViewControllerDelegate {

}
