//
//  MainUserServiceInfoCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.12.2022.
//

import UIKit
import SnapKit

final class MainUserServiceInfoCell: UICollectionViewCell {
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .dynamic(light: R.color.blueDark(), dark: R.color.blueDark())
        static let backgroundColorLineView: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.gray())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let heightImage: CGFloat = 300.0
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .font20RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .left
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameCityLabel: UILabel = {
        let label = UILabel()
        label.font = .font12Regular
        label.textColor = ViewMetrics.textColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var serviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .font16RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextLabel: UILabel = {
        let label = UILabel()
        label.font = .font12Regular
        label.text = R.string.localizable.commonNextPoints()
        label.textColor = ViewMetrics.textColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reviewsView: MainUserReviewsView = {
        let reviewsView = MainUserReviewsView()
        reviewsView.translatesAutoresizingMaskIntoConstraints = false
        return reviewsView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.backgroundColor = ViewMetrics.backgroundColor
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(nameCityLabel)
        contentView.addSubview(serviceImageView)
        contentView.addSubview(infoLabel)
        contentView.addSubview(nextLabel)
        contentView.addSubview(reviewsView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.spacing8Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        nameCityLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.spacing2Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        serviceImageView.snp.makeConstraints { make in
            make.top.equalTo(nameCityLabel.snp.bottom).offset(CGFloat.spacing8Pt)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(ViewMetrics.heightImage)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceImageView.snp.bottom).offset(CGFloat.spacing8Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
        }
        nextLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(CGFloat.spacing4Pt)
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.bottom.equalToSuperview().offset(-CGFloat.spacing8Pt)
        }
        reviewsView.snp.makeConstraints { make in
            make.left.equalTo(serviceImageView.snp.left).offset(CGFloat.spacing16Pt)
            make.bottom.equalTo(serviceImageView.snp.bottom).offset(-CGFloat.spacing8Pt)
        }
    }
    
    func configure(with viewModel: MainUserServicesViewModel) {
        titleLabel.text = viewModel.title
        nameCityLabel.text = viewModel.nameCityText
        serviceImageView.image = viewModel.image
        infoLabel.text = viewModel.infoText
        reviewsView.configure(countHeart: viewModel.countHeartText, countChat: viewModel.countChatText)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
}

