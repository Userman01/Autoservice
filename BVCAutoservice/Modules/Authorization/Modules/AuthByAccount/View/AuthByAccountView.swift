//
//  Created by postnikov_pp on 06/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit

final class AuthByAccountView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLargeTitle: UIColor! = .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let indicatorsStackViewSpacing: CGFloat = 20.0
        static let labelColor: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.gray())
        static let titleColorAuthButton: UIColor! = .dynamic(light: R.color.authTitleAuthButtonLight(), dark: R.color.authTitleAuthButtonDark())
        static let titleColorLabelAuth: UIColor! = .dynamic(light: R.color.authLabelColorLight(), dark: R.color.authLabelColorDark())
        static let backgroundColorAuthButton: UIColor! = .dynamic(light: R.color.authButtonColorLight(), dark: R.color.authButtonColorDark())
    }

    private weak var delegate: AuthByAccountViewControllerDelegate?

    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = ViewMetrics.backgroundColorLargeTitle
        label.text = R.string.localizable.commonAuthorization()
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
        let textField = PassportTextFieldView(label: R.string.localizable.passportEnterTextfieldLabelPassport())
        textField.set(textAlignment: .center)
        textField.didEditText = { [weak self] text in
            self?.didEditNewPassportText(text)
        }
        return textField
    }()
    
    private lazy var button: ActionButton = {
        let button = ActionButton(title: R.string.localizable.commonEnter())
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.authByAccountLabelForgetTitle()
        label.textColor = ViewMetrics.titleColorLabelAuth
        label.font = .font14Regular
        label.textAlignment = .center
        return label
    }()
    
    private lazy var authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.localizable.authByAccountButtonRecoveryTitle(), for: .normal)
        button.titleLabel?.font = .font14RegularNeuropol
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.setTitleColor(ViewMetrics.titleColorAuthButton, for: .normal)
        button.backgroundColor = ViewMetrics.backgroundColorAuthButton
        button.addTarget(self, action: #selector(authButtonTupped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emptyBottonView: UIView = {
        let view = UIView()
        view.backgroundColor = ViewMetrics.backgroundColorAuthButton
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(frame: CGRect, delegate: AuthByAccountViewControllerDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        setupLayout()
        addGestureRecognizerEndEditing()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        
        addSubview(titlelabel)
        addSubview(nameTextField)
        addSubview(passportTextField)
        addSubview(button)
        addSubview(label)
        addSubview(emptyView)
        addSubview(authButton)
        addSubview(emptyBottonView)
        
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
        
        button.snp.makeConstraints { make in
            make.top.equalTo(passportTextField.snp.bottom).offset(CGFloat.spacing80Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(emptyView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing80Pt)
        }
        authButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(CGFloat.spacing80Pt)
        }
        emptyBottonView.snp.makeConstraints { make in
            make.top.equalTo(authButton.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func configure(with viewModel: AuthByAccountViewModel) {
        button.isEnabled = viewModel.isEnabled
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
    
    @objc private func submit() {
        delegate?.submit()
    }
    
    @objc private func authButtonTupped() {
        delegate?.openCreateNewPassword()
    }
}
