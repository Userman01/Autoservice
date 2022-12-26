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
    /// Переход
    func tupButton()
}

typealias WelcomeOut = ((WelcomeOutCmd) -> Void)
enum WelcomeOutCmd {
    case open(WelcomeOutNavigationType)
}

final class WelcomeViewController: UIViewController {

    private let interactor: WelcomeBusinessLogic

    private lazy var customView = view as? WelcomeView
    private var out: WelcomeOut
    private let mode: RegistrationMode
    private var inModel: WelcomeInModel?

    init(interactor: WelcomeBusinessLogic, mode: RegistrationMode, inModel: WelcomeInModel?, out: @escaping WelcomeOut) {
        self.interactor = interactor
        self.out = out
        self.mode = mode
        self.inModel = inModel
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
        getFields(mode, inModel)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.primary)
    }

    // MARK: Получение полей
    private func getFields(_ mode: RegistrationMode, _ inModel: WelcomeInModel?) {
        interactor.getFields(request: Welcome.GetFields.Request(mode: mode, inModel: inModel))
    }
}

extension WelcomeViewController: WelcomeDisplayLogic {

    // MARK: Отображение полей
    func displayFields(viewModel: Welcome.GetFields.ViewModel) {
        customView?.configure(with: viewModel.result)
    }
}

extension WelcomeViewController: WelcomeViewControllerDelegate {
    // MARK: Переход
    func tupButton() {
        out(.open(.openMain))
    }
}
