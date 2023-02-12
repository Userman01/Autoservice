//
//  Created by postnikov_pp on 06/01/2023.
//  Copyright (c) 2023 BVC. All rights reserved.
//

import UIKit

final class MenuView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }
    
    private lazy var title: TitleLargeMenuView = {
        let title = TitleLargeMenuView(titleLargeMenuType: .withoutMenu)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.backgroundColor = ViewMetrics.backgroundColor
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
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
    }
}
