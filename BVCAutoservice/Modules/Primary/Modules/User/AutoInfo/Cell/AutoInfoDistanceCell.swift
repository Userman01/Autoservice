//
//  AutoInfoDistanceCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit
import SnapKit

final class AutoInfoDistanceCell: UITableViewCell {
    private enum ViewMetrics {
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let tintColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let margins: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: .spacing16Pt, leading: .spacing16Pt, bottom: .spacing16Pt, trailing: .spacing16Pt)
        static let sizeImage: CGRect = CGRect(x: .zero, y: .zero, width: CGFloat.spacing28Pt, height: CGFloat.spacing28Pt)
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: ViewMetrics.sizeImage)
        imageView.image = R.image.location()
        imageView.tintColor = ViewMetrics.tintColor
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .font12RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.setDirectionalLayoutMargins(ViewMetrics.margins)
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(iconImageView.snp.right).offset(CGFloat.spacing8Pt)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: AutoInfoDistanceViewModel) {
        label.text = viewModel.distance
    }
}
