//
//  AuthChoiceViewController.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

protocol AuthChoiceDisplayLogic: AnyObject {
    
}

typealias AuthChoiceOut = () -> Void
enum AuthChoiceOutCmd {
    
}

final class AuthChoiceViewController: UIViewController, AuthChoiceDisplayLogic {
    
    private let interactor: AuthChoiceBuisnessLogic
    
    private lazy var customView = self.view as? AuthChoiceView
    
    init(interactor: AuthChoiceBuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = AuthChoiceView(frame: UIScreen.main.bounds)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
