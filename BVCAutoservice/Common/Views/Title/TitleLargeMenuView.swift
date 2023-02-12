//
//  TitleLargeMenuView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 27.12.2022.
//

import UIKit
import SnapKit

class TitleLargeMenuView: UIView {
    
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColorLargeTitle
        static let tintColorButton: UIColor! = .dynamic(light: R.color.authTitleButtonLight(), dark: R.color.white())
    }
    
    enum TitleLargeMenuType {
        case primary
        case withoutMenu
    }
    
    var titleLargeMenuType: TitleLargeMenuType
    /// Вызывается при нажатии на меню
    var didTupMenu: (() -> Void)?
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.logo()
        imageView.contentMode = .top
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var buttonMenu: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(R.image.menu(), for: .normal)
        button.addTarget(self, action: #selector(tupButtonMenu), for: .touchUpInside)
        button.tintColor = ViewMetrics.tintColorButton
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(frame: CGRect = .zero,
         titleLargeMenuType: TitleLargeMenuType = .primary) {
        self.titleLargeMenuType = titleLargeMenuType
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = ViewMetrics.backgroundColor
        addSubview(logoImageView)
        addSubview(buttonMenu)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(CGFloat.spacing8Pt)
            make.bottom.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        buttonMenu.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-CGFloat.spacing8Pt)
            make.bottom.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        switch titleLargeMenuType {
        case .withoutMenu:
            buttonMenu.isHidden = true
        default:
            break
        }
    }
    
    @objc private func tupButtonMenu() {
        didTupMenu?()
    }
}
