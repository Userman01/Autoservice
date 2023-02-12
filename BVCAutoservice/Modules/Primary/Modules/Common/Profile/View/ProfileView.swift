//
//  Created by postnikov_pp on 07/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class ProfileView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }
    
    private lazy var titleView: TitleLargeView = {
        let title = TitleLargeView()
        return title
    }()

    private lazy var tableView: SpacedTableView = {
        let tableView = SpacedTableView()
        tableView.backgroundColor = ViewMetrics.backgroundColor
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupLayout()
        addGestureRecognizerEndEditing()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        addSubview(titleView)
        addSubview(tableView)
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleView.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func updateTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.reloadData()
        DispatchQueue.main.async { [weak tableView] in
            tableView?.reloadSpacer()
        }
    }
    
    func configure(viewModel: ProfileViewModel) {
        titleView.configure(title: viewModel.title, description: viewModel.description)
    }
}
