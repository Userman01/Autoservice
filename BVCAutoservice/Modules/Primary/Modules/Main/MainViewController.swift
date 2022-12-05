//
//  Main module
//
//  Created by postnikov_pp on 05/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

protocol MainDisplayLogic: AnyObject {

    // Отображение полей
    func displayFields(viewModel: Main.GetFields.ViewModel)
}

protocol MainViewControllerDelegate: AnyObject {

}

final class MainViewController: UIViewController {

    private let interactor: MainBusinessLogic

    private lazy var customView = view as? MainView

    init(interactor: MainBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = MainView(frame: UIScreen.main.bounds, delegate: self)
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
        interactor.getFields(request: Main.GetFields.Request())
    }
}

extension MainViewController: MainDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: Main.GetFields.ViewModel) {
        customView?.configure(with: viewModel.result)
    }
}

extension MainViewController: MainViewControllerDelegate {

}
