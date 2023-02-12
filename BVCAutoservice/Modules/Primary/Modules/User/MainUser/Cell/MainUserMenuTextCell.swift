//
//  MainUserMenuTextCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.12.2022.
//

import UIKit
import SnapKit

final class MainUserMenuTextCell: UICollectionViewCell {
    private enum ViewMetrics {
        static let backgroundColorLineView: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.gray())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .font12RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ViewMetrics.backgroundColorLineView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            lineView.backgroundColor = isSelected ? R.color.white() : ViewMetrics.backgroundColorLineView
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(label)
        contentView.addSubview(lineView)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(CGFloat.spacing4Pt)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing2Pt)
        }
    }
    
    func configure(with viewModel: MainUserMenuViewModel) {
        label.text = viewModel.tittle
    }
}
