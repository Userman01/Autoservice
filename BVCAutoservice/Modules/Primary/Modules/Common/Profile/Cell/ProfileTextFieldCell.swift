//
//  ProfileTextFieldCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 09.01.2023.
//

import UIKit
import SnapKit

final class ProfileTextFieldCell: UITableViewCell {
    private enum ViewMetrics {
        static let insetsSize = NSDirectionalEdgeInsets(top: .spacing8Pt, leading: .spacing16Pt, bottom: .spacing8Pt, trailing: .spacing16Pt)
    }
    
    private lazy var textFieldView: MainTextFieldView = {
       let textField = MainTextFieldView()
        textField.set(textAlignment: .center)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func  setupLayout() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(textFieldView)
        
        setDirectionalLayoutMargins(ViewMetrics.insetsSize)
        
        textFieldView.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: ProfileTextViewModel) {
        textFieldView.titleLabel.text = viewModel.title
        textFieldView.label.text = viewModel.label
        textFieldView.textField.isEnabled = viewModel.isEnabled
    }
}
