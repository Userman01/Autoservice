//
//  Profile module
//
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

protocol ProfileDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: Profile.GetFields.ViewModel)
}

protocol ProfileViewControllerDelegate: AnyObject {

}

final class ProfileViewController: UIViewController {

    private let interactor: ProfileBusinessLogic
    private let tableDataSource = ProfileTableDataSource()
    private let tableDelegate = ProfileTableDelegate()

    private lazy var customView = view as? ProfileView

    init(interactor: ProfileBusinessLogic) {
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
        view = ProfileView()
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
        interactor.getFields(request: Profile.GetFields.Request())
    }
}

extension ProfileViewController: ProfileDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: Profile.GetFields.ViewModel) {
        customView?.configure(viewModel: viewModel.result)
        tableDelegate.representableViewModels = viewModel.result.cells
        tableDataSource.representableViewModels = viewModel.result.cells
        customView?.updateTableView(dataSource: tableDataSource, delegate: tableDelegate)
    }
}

extension ProfileViewController: ProfileViewControllerDelegate {

}
