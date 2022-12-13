//
//  Welcome module
//
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

protocol WelcomeDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: Welcome.GetFields.ViewModel)
}

protocol WelcomeViewControllerDelegate: AnyObject {

}

final class WelcomeViewController: UIViewController {

    private let interactor: WelcomeBusinessLogic

    private lazy var customView = view as? WelcomeView

    init(interactor: WelcomeBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = WelcomeView(frame: UIScreen.main.bounds, delegate: self)
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
        interactor.getFields(request: Welcome.GetFields.Request())
    }
}

extension WelcomeViewController: WelcomeDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: Welcome.GetFields.ViewModel) {
        customView?.configure(with: viewModel.result)
    }
}

extension WelcomeViewController: WelcomeViewControllerDelegate {

}
