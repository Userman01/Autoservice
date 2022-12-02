//
//  AuthChoiceView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit
import SnapKit

final class RegistrationView: UIView {
    
    private enum  ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLargeTitle: UIColor! = .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
    }
    
    weak var delegate: RegistrationViewControllerDelegate?
    
    lazy private var titlelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = ViewMetrics.backgroundColorLargeTitle
        label.text = R.string.localizable.commonRegistration()
        label.font = .font20Regular
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var textField: TextFieldView = {
        let textField = TextFieldView(label: R.string.localizable.registrationEnterPhoneNumberTitle())
        textField.set(keyboardType: .numberPad)
        textField.didEditText = { [weak self] text in
            self?.didEditText(text)
        }
        return textField
    }()
    
    lazy private var button: ActionButton = {
        let button = ActionButton(title: R.string.localizable.commonNext())
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
        addGestureRecognizerEndEditing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        
        addSubview(titlelabel)
        addSubview(textField)
        addSubview(button)
        
        titlelabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing60Pt)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titlelabel.snp.bottom).offset(CGFloat.spacing120Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(CGFloat.spacing80Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
    }
    
    func configure(viewModel: RegistrationViewModel) {
        button.isEnabled = viewModel.isEnabled
    }
    
    func setButtonState(isEnabled: Bool) {
        button.isEnabled = isEnabled
    }
    
    private func didEditText(_ text: String) {
        delegate?.setPhoneNumber(value: text)
    }
    
    @objc private func submit() {
        delegate?.submit()
    }
}
