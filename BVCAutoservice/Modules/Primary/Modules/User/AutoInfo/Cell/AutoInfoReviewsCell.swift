//
//  AutoInfoReviewsCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 11.01.2023.
//

import UIKit
import SnapKit

final class AutoInfoReviewsCell: UITableViewCell {
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .clear
        static let margins: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: .spacing16Pt, leading: .spacing16Pt, bottom: .spacing32Pt, trailing: .spacing16Pt)
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = true
        tableView.backgroundColor = ViewMetrics.backgroundColor
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var tableViewDataSource: AutoInfoReviewsTableDataSource = AutoInfoReviewsTableDataSource()
    var tableViewDelegate: AutoInfoReviewsTableDelegate = AutoInfoReviewsTableDelegate()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        setupLayout()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(tableView)
        
        backgroundColor = .clear
        selectionStyle = .none

        contentView.setDirectionalLayoutMargins(ViewMetrics.margins)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
    }
    
    func configure(with viewModel: [AutoInfoReviewsViewModel]) {
        tableViewDataSource.representableViewModels = viewModel
        tableViewDelegate.representableViewModels = viewModel
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
}
