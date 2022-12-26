//  ___FILEHEADER___

import UIKit

final class ___VARIABLE_productName:identifier___View: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = ViewMetrics.backgroundColor
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
        addSubview(tableView)
        tableView.frame = frame
    }

    func updateTableView(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.reloadData()
    }
}