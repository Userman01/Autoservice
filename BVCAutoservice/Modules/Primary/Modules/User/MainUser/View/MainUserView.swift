//
//  Created by postnikov_pp on 22/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit
import SnapKit

final class MainUserView: UIView {

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
        tableView.isScrollEnabled = false
        tableView.backgroundColor = ViewMetrics.backgroundColor
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var button: ActionButton = {
        let button = ActionButton(style: .second)
        button.setTitle(R.string.localizable.mainUserButtonFilterTitle(), for: .normal)
        button.addTarget(self, action: #selector(didTupButton), for: .touchUpInside)
        return button
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
        addSubview(button)
        
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
        button.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(CGFloat.spacing16Pt)
            make.right.equalToSuperview().offset(-CGFloat.spacing16Pt)
            make.bottom.equalToSuperview().offset(-CGFloat.spacing60Pt)
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
    
    @objc private func didTupButton() {
        print("tupButton")
    }
}
