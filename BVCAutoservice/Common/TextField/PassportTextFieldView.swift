//
//  PassportTextFieldView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 02.12.2022.
//

import UIKit
import SnapKit

final class PassportTextFieldView: TextFieldView {
    
    private enum ViewMetrics {
        static let buttonInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
    
    private lazy var iconButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = ViewMetrics.buttonInsets
        button.layer.backgroundColor = R.color.red()?.cgColor
        button.addTarget(self, action: #selector(changeSecure(_:)), for: .touchUpInside)
        return button
    }()
    
    init(label: String? = nil) {
        super.init(label: label)
        textField.isSecureTextEntry = true
        textField.rightView = iconButton
        textField.rightViewMode = .always
        textField.textContentType = .password
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func changeSecure(_ button: UIButton) {
        textField.isSecureTextEntry.toggle()
        button.layer.backgroundColor = textField.isSecureTextEntry ? R.color.red()?.cgColor : R.color.green()?.cgColor
    }
}
