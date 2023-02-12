//
//  Created by postnikov_pp on 10/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class AutoInfoView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }
    
    private lazy var title: TitleLargeMenuView = {
        let title = TitleLargeMenuView()
        title.didTupMenu = {
            self.didTupMenu()
        }
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = ViewMetrics.backgroundColor
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(frame: CGRect, tableDataSource: UITableViewDataSource, tableDelegate: UITableViewDelegate) {
        super.init(frame: frame)
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDelegate
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        addSubview(title)
        addSubview(tableView)
        
        title.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func updateTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
    
    private func didTupMenu() {
        print("tup")
    }
}
