//
//  AutoInfoReviewPersonCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit
import SnapKit

final class AutoInfoReviewPersonCell: UITableViewCell {
    private enum ViewMetrics {
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let tintColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let margins: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: .spacing16Pt, leading: .zero, bottom: .spacing16Pt, trailing: .zero)
        static let backgroundImage: UIColor! = .dynamic(light: R.color.blue(), dark: R.color.blue())
        static let cornerRadius: CGFloat = 21.0
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.profilePreson()
        imageView.contentMode = .center
        imageView.backgroundColor = ViewMetrics.backgroundImage
        imageView.layer.cornerRadius = ViewMetrics.cornerRadius
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.font = .font12RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.textColor = ViewMetrics.textColor
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.font = .font12RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
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
        contentView.addSubview(titlelabel)
        contentView.addSubview(descriptionlabel)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.setDirectionalLayoutMargins(ViewMetrics.margins)
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.width.equalTo(CGFloat.spacing42Pt)
            make.height.equalTo(CGFloat.spacing42Pt)
        }
        titlelabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(iconImageView.snp.right).offset(CGFloat.spacing8Pt)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
        }
        descriptionlabel.snp.makeConstraints { make in
            make.top.equalTo(titlelabel.snp.bottom).offset(CGFloat.spacing8Pt)
            make.left.equalTo(iconImageView.snp.right).offset(CGFloat.spacing8Pt)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: AutoInfoReviewsViewModel) {
        titlelabel.text = viewModel.title
        descriptionlabel.text = viewModel.description
    }
}

