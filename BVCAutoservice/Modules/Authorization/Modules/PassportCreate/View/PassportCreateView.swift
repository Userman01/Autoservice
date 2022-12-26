//
//  AuthChoiceView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit
import SnapKit

final class PassportCreateView: UIView {
    
    private enum  ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLargeTitle: UIColor! = .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let textDescribeColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.blue())
        static let indicatorsStackViewSpacing: CGFloat = 20.0
        static let labelColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.gray())
    }
    
    weak var delegate: PassportCreateViewControllerDelegate?
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = ViewMetrics.backgroundColorLargeTitle
        label.text = R.string.localizable.commonRegistration()
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameTextField: TextFieldView = {
        let textField = TextFieldView(label: R.string.localizable.passportCreateTextfieldLabelName())
        textField.set(keyboardType: .default)
        textField.set(textAlignment: .center)
        textField.didEditText = { [weak self] text in
            self?.didEditNameText(text)
        }
        return textField
    }()
    
    private lazy var passportTextField: PassportTextFieldView = {
        let textField = PassportTextFieldView(label: R.string.localizable.passportCreateTextfieldLabelPassport())
        textField.set(textAlignment: .center)
        textField.didEditText = { [weak self] text in
            self?.didEditNewPassportText(text)
        }
        return textField
    }()
    
    private lazy var passportRepeateTextField: PassportTextFieldView = {
        let textField = PassportTextFieldView(label: R.string.localizable.passportCreateTextfieldLabelRepeatePassport())
        textField.set(textAlignment: .center)
        textField.didEditText = { [weak self] text in
            self?.didEditRepeatePassportText(text)
        }
        return textField
    }()
    
    private lazy var describelabel: UILabel = {
        let label = UILabel()
        label.font = .font14Regular
        label.textColor = ViewMetrics.textDescribeColor
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: ActionButton = {
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
        addSubview(nameTextField)
        addSubview(passportTextField)
        addSubview(passportRepeateTextField)
        addSubview(button)
        addSubview(describelabel)
        
        titlelabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing60Pt)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titlelabel.snp.bottom).offset(CGFloat.spacing120Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        
        passportTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(CGFloat.spacing40Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        
        passportRepeateTextField.snp.makeConstraints { make in
            make.top.equalTo(passportTextField.snp.bottom).offset(CGFloat.spacing40Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-CGFloat.spacing20Pt)
        }
        
        describelabel.snp.makeConstraints { make in
            make.top.equalTo(passportRepeateTextField.snp.bottom).offset(CGFloat.spacing40Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing32Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing32Pt)
        }
    }
    
    func configure(viewModel: PassportCreateViewModel) {
        button.isEnabled = viewModel.isEnabled
        titlelabel.text = viewModel.title
        describelabel.text = viewModel.describeTitle
        if viewModel.nameUser != nil {
            setupLabel(text: viewModel.nameUser ?? "")
        }
    }
    
    func setButtonState(isEnabled: Bool) {
        button.isEnabled = isEnabled
    }
    
    private func didEditNameText(_ text: String) {
        delegate?.setName(value: text)
    }
    
    private func didEditNewPassportText(_ text: String) {
        delegate?.setNewPassport(value: text)
    }
    
    private func didEditRepeatePassportText(_ text: String) {
        delegate?.setRepeatePassport(value: text)
    }
    
    private func setupLabel(text: String) {
        nameTextField.isHidden = true
        let label = UILabel()
        label.text = text
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(titlelabel.snp.bottom).offset(CGFloat.spacing120Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
    }
    
    @objc private func submit() {
        delegate?.submit()
    }
}
