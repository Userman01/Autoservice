//
//  AuthChoiceViewController.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit

protocol AuthChoiceDisplayLogic: AnyObject {
    
}

final class AuthChoiceViewController: UIViewController, AuthChoiceDisplayLogic {
    
    private let interactor: AuthChoiceBuisnessLogic
    
    init(interactor: AuthChoiceBuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
