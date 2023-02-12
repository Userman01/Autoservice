//
//  AutoInfoServicesCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit
import SnapKit

final class AutoInfoServicesCell: UITableViewCell {
    private enum ViewMetrics {
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let margins: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: .spacing16Pt, leading: .spacing16Pt, bottom: .spacing16Pt, trailing: .spacing16Pt)
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .font16RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: DynamicHeightCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = .spacing16Pt
        let collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        collectionView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var collectionViewDataSource: AutoInfoServicesCollectionDataSource = AutoInfoServicesCollectionDataSource()
    var collectionViewDelegate: AutoInfoServicesCollectionDelegate = AutoInfoServicesCollectionDelegate()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        setupLayout()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(label)
        contentView.addSubview(collectionView)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.setDirectionalLayoutMargins(ViewMetrics.margins)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(CGFloat.spacing16Pt)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: AutoInfoServicesViewModel) {
        label.text = viewModel.title
        collectionViewDataSource.representableViewModels = viewModel.texts
        collectionViewDelegate.representableViewModels = viewModel.texts
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
}
