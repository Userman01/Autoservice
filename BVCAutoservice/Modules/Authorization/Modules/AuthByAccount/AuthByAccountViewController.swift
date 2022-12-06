//
//  AuthByAccount module
//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

protocol AuthByAccountDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: AuthByAccount.GetFields.ViewModel)
}

protocol AuthByAccountViewControllerDelegate: AnyObject {

}

final class AuthByAccountViewController: UIViewController {

    private let interactor: AuthByAccountBusinessLogic

    private lazy var customView = view as? AuthByAccountView

    init(interactor: AuthByAccountBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = AuthByAccountView(frame: UIScreen.main.bounds, delegate: self)
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
        interactor.getFields(request: AuthByAccount.GetFields.Request())
    }
}

extension AuthByAccountViewController: AuthByAccountDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: AuthByAccount.GetFields.ViewModel) {
        customView?.configure(with: viewModel.result)
    }
}

extension AuthByAccountViewController: AuthByAccountViewControllerDelegate {

}
