//
//  Menu module
//
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: Menu.GetFields.ViewModel)
}

protocol MenuViewControllerDelegate: AnyObject {
    // didTupInstagram
    func didTupInstagram()
    // didTupPhone
    func didTupPhone()
    // didTupFacebook
    func didTupFacebook()
}

final class MenuViewController: UIViewController {

    private let interactor: MenuBusinessLogic
    private let tableDataSource = MenuTableDataSource()
    private let tableDelegate = MenuTableDelegate()

    private lazy var customView = view as? MenuView

    init(interactor: MenuBusinessLogic) {
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
        view = MenuView()
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
        interactor.getFields(request: Menu.GetFields.Request())
    }
}

extension MenuViewController: MenuDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: Menu.GetFields.ViewModel) {
        tableDelegate.representableViewModels = viewModel.result
        tableDataSource.representableViewModels = viewModel.result
        customView?.updateTableView(dataSource: tableDataSource, delegate: tableDelegate)
    }
}

extension MenuViewController: MenuViewControllerDelegate {
    // MARK: didTupInstagram
    func didTupInstagram() {
        print("didTupInstagram")
    }
    // MARK: didTupPhone
    func didTupPhone() {
        print("didTupPhone")
    }
    // MARK: didTupFacebook
    func didTupFacebook() {
        print("didTupFacebook")
    }
}
