//
//  Created by postnikov_pp on 30/11/2022.
//

import UIKit

class AuthBySMSCodeView: UIView {
    
    private enum  ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLargeTitle: UIColor! = .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
    }
    
    weak var delegate: AuthBySMSCodeViewControllerDelegate?
    
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
        let textField = TextFieldView(label: R.string.localizable.registrationEnterSmsCodeTitle())
        textField.set(keyboardType: .numberPad)
        textField.didEditText = { [weak self] text in
            self?.didEditText(text)
        }
        return textField
    }()
    
    lazy private var button: ActionButton = {
        let button = ActionButton(title: R.string.localizable.authSmsGo())
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
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.bottom.equalTo(button.snp.top).offset(-CGFloat.spacing96Pt)
        }
        
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.center.equalTo(snp.center)
        }
    }
    
    func configure(viewModel: AuthBySMSCodeViewModel) {
        button.isEnabled = viewModel.isEnabled
    }
    
    func setButtonState(isEnabled: Bool) {
        button.isEnabled = isEnabled
    }
    
    private func didEditText(_ text: String) {
        delegate?.setPhoneNumber(value: text)
    }
    
    @objc private func submit() {
        
    }
}
