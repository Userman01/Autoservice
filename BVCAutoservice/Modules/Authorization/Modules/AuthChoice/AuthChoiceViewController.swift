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
    func didTupp(with: AuthChoiceModel?)
}

typealias AuthChoiceOut = (AuthChoiceOutCmd) -> Void
enum AuthChoiceOutCmd {
    case open(AuthChoiceModel?)
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
    
    private func getScreen() {
        interactor.getScreen(request: AuthChoice.GetScreens.Request())
    }
}

extension AuthChoiceViewController: AuthChoiceDisplayLogic {
    
    // MARK: Отображения экрана
    func displayScreen(viewModel: AuthChoice.GetScreens.ViewModel) {
    }
}

extension AuthChoiceViewController: AuthChoiceDelegateViewController {
    
    func didTupp(with: AuthChoiceModel?) {
        out(.open(with))
    }
}
