//
//  SpacerCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 07.01.2023.
//

import UIKit

final class SpacerCell: UITableViewCell {

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
        contentView.setDirectionalLayoutMargins(.zero)
    }
}
