//
//  ReviewsView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 06.01.2023.
//

import UIKit

final class MainUserReviewsView: UIView {
    
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.blue())
        static let sizeImage: CGRect = CGRect(x: .zero, y: .zero, width: CGFloat.spacing28Pt, height: CGFloat.spacing28Pt)
    }
    
    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView(frame: ViewMetrics.sizeImage)
        imageView.image = R.image.heart()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var countHeartLabel: UILabel = {
        let label = UILabel()
        label.font = .font20Bold
        label.textColor = ViewMetrics.textColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var chatImageView: UIImageView = {
        let imageView = UIImageView(frame: ViewMetrics.sizeImage)
        imageView.image = R.image.chat()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var countChatLabel: UILabel = {
        let label = UILabel()
        label.font = .font20Bold
        label.textColor = ViewMetrics.textColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(heartImageView)
        addSubview(chatImageView)
        addSubview(countHeartLabel)
        addSubview(countChatLabel)
        
        heartImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        countHeartLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(heartImageView.snp.right).offset(CGFloat.spacing8Pt)
            make.bottom.equalToSuperview()
        }
        chatImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(countHeartLabel.snp.right).offset(CGFloat.spacing16Pt)
            make.bottom.equalToSuperview()
        }
        countChatLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(chatImageView.snp.right).offset(CGFloat.spacing8Pt)
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(countHeart: String, countChat: String) {
        countHeartLabel.text = countHeart
        countChatLabel.text = countChat
    }
}
