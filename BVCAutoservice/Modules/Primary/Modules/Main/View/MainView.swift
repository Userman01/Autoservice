//
//  Created by postnikov_pp on 05/12/2022.
//  Copyright (c) 2022 BVC. All rights reserved.
//

import UIKit
import SnapKit

final class MainView: UIView {

    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor
        static let backgroundColorLargeTitle: UIColor! = .dynamic(light: R.color.barStyleLight(), dark: R.color.barStyleDark())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
    }

    private weak var delegate: MainViewControllerDelegate?
    
    lazy private var titlelabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = ViewMetrics.backgroundColorLargeTitle
        label.text = "Главный экран"
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(frame: CGRect, delegate: MainViewControllerDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = ViewMetrics.backgroundColor
        
        addSubview(titlelabel)
        
        titlelabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(CGFloat.spacing60Pt)
        }
    }

    func configure(with viewModel: MainViewModel) {

    }
}
