//
//  AuthChoiceView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.11.2022.
//

import UIKit
import SnapKit

final class AuthChoiceView: UIView {
    
    private enum  ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLineView: UIColor! = .dynamic(light: R.color.lineViewLight(), dark: R.color.lineViewDark())
        static let backgroundColorAuthButton: UIColor! = .dynamic(light: R.color.authButtonColorLight(), dark: R.color.authButtonColorDark())
        static let titleColorButton: UIColor! = .dynamic(light: R.color.authTitleButtonLight(), dark: R.color.authTitleButtonDark())
        static let titleColorAuthButton: UIColor! = .dynamic(light: R.color.authTitleAuthButtonLight(), dark: R.color.authTitleAuthButtonDark())
        static let titleColorLabelAuth: UIColor! = .dynamic(light: R.color.authLabelColorLight(), dark: R.color.authLabelColorDark())
    }
    
    weak var delegate: AuthChoiceDelegateViewController?
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo()
        imageView.contentMode = .top
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.localizable.authChoiceButtonUserTitle(), for: .normal)
        button.titleLabel?.font = .font20Regular
        button.setTitleColor(ViewMetrics.titleColorButton, for: .normal)
        button.addTarget(self, action: #selector(userButtonTupped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var serviceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.localizable.authChoiceButtonServiceTitle(), for: .normal)
        button.setTitleColor(ViewMetrics.titleColorButton, for: .normal)
        button.titleLabel?.font = .font20Regular
        button.addTarget(self, action: #selector(serviceButtonTupped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.localizable.commonEnter(), for: .normal)
        button.titleLabel?.font = .font16Regular
        button.setTitleColor(ViewMetrics.titleColorAuthButton, for: .normal)
        button.backgroundColor = ViewMetrics.backgroundColorAuthButton
        button.addTarget(self, action: #selector(authButtonTupped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ViewMetrics.backgroundColorLineView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelAuth: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.authChoiceLabelAuth()
        label.textColor = ViewMetrics.titleColorLabelAuth
        label.textAlignment = .center
        return label
    }()
    
    private lazy var emptyBottonView: UIView = {
        let view = UIView()
        view.backgroundColor = ViewMetrics.backgroundColorAuthButton
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        addSubview(logoImageView)
        addSubview(userButton)
        addSubview(serviceButton)
        addSubview(lineView)
        addSubview(labelAuth)
        addSubview(authButton)
        addSubview(emptyView)
        addSubview(emptyBottonView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        userButton.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing80Pt)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(userButton.snp.bottom)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.height.equalTo(CGFloat.spacing2Pt)
        }
        serviceButton.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerY.equalTo(snp.centerY)
            make.height.equalTo(CGFloat.spacing80Pt)
        }
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(serviceButton.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        labelAuth.snp.makeConstraints { make in
            make.top.equalTo(emptyView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing80Pt)
        }
        authButton.snp.makeConstraints { make in
            make.top.equalTo(labelAuth.snp.bottom)
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
    
    func configure(viewModel: AuthChoiceViewModel) {
    }
    
    @objc private func userButtonTupped() {
        delegate?.didTupp(with: .user)
    }
    
    @objc private func serviceButtonTupped() {
        delegate?.didTupp(with: .service)
    }
    
    @objc private func authButtonTupped() {
        delegate?.openAuth()
    }
}
