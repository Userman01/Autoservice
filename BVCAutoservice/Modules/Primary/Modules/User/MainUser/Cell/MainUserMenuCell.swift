//
//  MainUserMenuCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.12.2022.
//

import UIKit
import SnapKit

final class MainUserMenuCell: UITableViewCell {
    private enum ViewMetrics {
        
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var collectionViewDataSource: MainUserMenuCollectionDataSource = MainUserMenuCollectionDataSource()
    var collectionViewDelegate: MainUserMenuCollectionDelegate = MainUserMenuCollectionDelegate()
    
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
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.bottom.equalToSuperview()
            make.height.equalTo(CGFloat.spacing80Pt)
        }
    }
    
    func configure(with viewModel: [MainUserMenuViewModel]) {
        collectionViewDataSource.representableViewModels = viewModel
        collectionViewDelegate.representableViewModels = viewModel
        collectionView.reloadData()
        collectionView.selectItem(at: [0, 0], animated: true, scrollPosition: [])
    }
}

