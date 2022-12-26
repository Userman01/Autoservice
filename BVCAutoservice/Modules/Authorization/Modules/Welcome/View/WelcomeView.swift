//
//  Created by postnikov_pp on 13/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit
import SnapKit

final class WelcomeView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLargeTitle: UIColor! = .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let contentInsets = UIEdgeInsets(top: CGFloat.spacing12Pt, left: 0, bottom: CGFloat.spacing12Pt, right: 0)
    }

    private weak var delegate: WelcomeViewControllerDelegate?

    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = ViewMetrics.backgroundColorLargeTitle
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: InsetLabel = {
        let label = InsetLabel()
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.contentInsets = ViewMetrics.contentInsets
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: ActionButton = {
        let button = ActionButton(title: R.string.localizable.commonEnter())
        button.addTarget(self, action: #selector(tupButton), for: .touchUpInside)
        return button
    }()

    init(frame: CGRect, delegate: WelcomeViewControllerDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        addSubview(titlelabel)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(button)
        
        titlelabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing60Pt)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(titlelabel.snp.bottom).offset(CGFloat.spacing120Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-CGFloat.spacing20Pt)
        }
    }

    func configure(with viewModel: WelcomeViewModel) {
        titlelabel.text = viewModel.title
        nameLabel.text = "\(viewModel.userName),"
        descriptionLabel.text = viewModel.describe
        button.setTitle(viewModel.buttonTitle, for: .normal)
        setupSpacingLineDescriptionLabel(viewModel.describe)
    }
    
    private func setupSpacingLineDescriptionLabel(_ text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineSpacing = CGFloat.spacing12Pt
        paragraphStyle.alignment = .center
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length))
        
        descriptionLabel.attributedText = attributedString
    }
    
    @objc private func tupButton() {
        delegate?.tupButton()
    }
}
