//  ___FILEHEADER___

import UIKit

final class ___VARIABLE_productName:identifier___View: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
    }

    private weak var delegate: ___VARIABLE_productName:identifier___ViewControllerDelegate?

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(frame: CGRect, delegate: ___VARIABLE_productName:identifier___ViewControllerDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
    }

    func configure(with viewModel: ___VARIABLE_productName:identifier___ViewModel) {

    }
}