//
//  AuthChoiceViewController.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

protocol AuthChoiceDisplayLogic: AnyObject {
    /// Отображения экрана
    func displayScreen(viewModel: AuthChoice.GetScreens.ViewModel)
}

protocol AuthChoiceDelegateViewController: NSObject {
    
    func didTupp(with: UserRoleType)
    
    func openAuth()
}

typealias AuthChoiceOut = (AuthChoiceOutCmd) -> Void
enum AuthChoiceOutCmd {
    case open(UserRoleType)
    case openAuth
}

final class AuthChoiceViewController: UIViewController {
    
    private let interactor: AuthChoiceBuisnessLogic
    
    private lazy var customView = self.view as? AuthChoiceView
    
    private let out: AuthChoiceOut
    
    init(interactor: AuthChoiceBuisnessLogic, out: @escaping AuthChoiceOut) {
        self.interactor = interactor
        self.out = out
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = AuthChoiceView()
        self.view = view
        view.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle(.clear, isLargeTitle: false)
    }
    
    private func getScreen() {
        interactor.getScreen(request: AuthChoice.GetScreens.Request())
    }
}

extension AuthChoiceViewController: AuthChoiceDisplayLogic {
    
    // MARK: Отображения экрана
    func displayScreen(viewModel: AuthChoice.GetScreens.ViewModel) {
        customView?.configure(viewModel: viewModel.result)
    }
}

extension AuthChoiceViewController: AuthChoiceDelegateViewController {
    
    func didTupp(with: UserRoleType) {
        out(.open(with))
    }
    
    func openAuth() {
        out(.openAuth)
    }
}
