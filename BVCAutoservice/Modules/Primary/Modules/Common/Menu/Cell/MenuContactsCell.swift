//
//  MenuContactsCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 07.01.2023.
//

import UIKit
import SnapKit

final class MenuContactsCell: UITableViewCell {
    
    private enum ViewMetrics {
        static let tintColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
    }
    
    var didTupInst: (() -> Void)?
    var didTupFacebook: (() -> Void)?
    var didTupPhone: (() -> Void)?
    
    private lazy var instaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(R.image.instagram(), for: .normal)
        button.tintColor = ViewMetrics.tintColor
        button.addTarget(self, action: #selector(tupInstagram), for: .touchUpInside)
        return button
    }()
    
    private lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(R.image.facebook(), for: .normal)
        button.tintColor = ViewMetrics.tintColor
        button.addTarget(self, action: #selector(tupFacebook), for: .touchUpInside)
        return button
    }()
    
    private lazy var phoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(R.image.phone(), for: .normal)
        button.tintColor = ViewMetrics.tintColor
        button.addTarget(self, action: #selector(tupPhone), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [instaButton, facebookButton, phoneButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(CGFloat.spacing120Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing120Pt)
            make.bottom.equalToSuperview()
        }
    }
    
    @objc private func tupInstagram() {
        didTupInst?()
    }
    
    @objc private func tupFacebook() {
        didTupFacebook?()
    }
    
    @objc private func tupPhone() {
        didTupPhone?()
    }
}
