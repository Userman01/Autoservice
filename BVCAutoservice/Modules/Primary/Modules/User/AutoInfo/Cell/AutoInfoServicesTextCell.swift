//
//  AutoInfoServicesTextCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit
import SnapKit

final class AutoInfoServicesTextCell: UICollectionViewCell {
    private enum ViewMetrics {
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let margins: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: .zero, leading: .zero, bottom: .zero, trailing: .zero)
        static let cornerRadius: CGFloat = 5.0
        static let borderColor: UIColor! = .dynamic(light: R.color.lightBlue(), dark: R.color.lightBlue())
        static let borderWidth: CGFloat = 1.0
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .font12Regular
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(label)
        
        contentView.layer.borderWidth = ViewMetrics.borderWidth
        contentView.layer.borderColor = ViewMetrics.borderColor.cgColor
        contentView.layer.cornerRadius = ViewMetrics.cornerRadius
        
        contentView.backgroundColor = .clear
        
        contentView.setDirectionalLayoutMargins(ViewMetrics.margins)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: String) {
        label.text = viewModel
    }
}
