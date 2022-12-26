//  ___FILEHEADER___

import UIKit

final class ___VARIABLE_productName:identifier___TableDataSource: NSObject, UITableViewDataSource {

    weak var delegate: ___VARIABLE_productName:identifier___ViewControllerDelegate?

    var representableViewModels: [String]

    init(viewModels: [String] = []) {
        representableViewModels = viewModels
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        representableViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}