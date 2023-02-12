//
//  ActionButtonCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 09.01.2023.
//

import UIKit
import SnapKit

final class ActionButtonCell: UITableViewCell {
    private enum ViewMetrics {
    }
    
    private lazy var button: ActionButton = {
       let button = ActionButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func  setupLayout() {
        contentView.addSubview(button)
        selectionStyle = .none
        backgroundColor = .clear
        
        button.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: ActionButtonCellViewModel) {
        button.setButtonStyle(viewModel.buttonStyle)
        button.setTitle(viewModel.buttonTitle, for: .normal)
        contentView.setDirectionalLayoutMargins(viewModel.margins)
    }
}
