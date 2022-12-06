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
        static let tintColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.gray())
    }
    
    private lazy var iconButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = ViewMetrics.buttonInsets
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.imageView?.tintColor = ViewMetrics.tintColor
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
        let image = textField.isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye")
        button.setImage(image, for: .normal)
    }
}
