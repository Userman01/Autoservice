//
//  MainUserServiceCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.12.2022.
//

import UIKit
import SnapKit

final class MainUserServiceCell: UITableViewCell {
    private enum ViewMetrics {
        
    }
    
    private lazy var collectionView: DynamicHeightCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        let collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var collectionViewDataSource: MainUserServiceCollectionDataSource = MainUserServiceCollectionDataSource()
    var collectionViewDelegate: MainUserServiceCollectionDelegate = MainUserServiceCollectionDelegate()
    
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
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(with viewModel: [MainUserServicesViewModel]) {
        collectionViewDataSource.representableViewModels = viewModel
        collectionViewDelegate.representableViewModels = viewModel
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
}
