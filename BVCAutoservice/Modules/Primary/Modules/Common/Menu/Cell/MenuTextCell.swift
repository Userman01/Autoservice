//
//  MenuTextCell.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 06.01.2023.
//

import UIKit
import SnapKit

final class MenuTextCell: UITableViewCell {
    private enum ViewMetrics {
        static let backgroundColorLineView: UIColor! = .dynamic(light: R.color.gray(), dark: R.color.blue())
        static let backgroundColorLineViewIsSelected: UIColor! = .dynamic(light: R.color.white(), dark: R.color.lightBlue())
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let directionalLayoutMargins = NSDirectionalEdgeInsets(top: .spacing24Pt, leading: .spacing16Pt, bottom: .spacing24Pt, trailing: .spacing16Pt)
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .font14RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ViewMetrics.backgroundColorLineView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.setDirectionalLayoutMargins(ViewMetrics.directionalLayoutMargins)
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(label)
        contentView.addSubview(lineView)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(contentView.layoutMarginsGuide.snp.top)
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalTo(contentView.layoutMarginsGuide.snp.bottom)
        }
        lineView.snp.makeConstraints { make in
            make.left.equalTo(contentView.layoutMarginsGuide.snp.left)
            make.right.equalTo(contentView.layoutMarginsGuide.snp.right)
            make.bottom.equalToSuperview()
            make.height.equalTo(CGFloat.spacing2Pt)
        }
    }
    
    func configure(with viewModel: MenuTextViewModel) {
        label.text = viewModel.title
    }
}

extension MenuTextCell {
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        lineView.backgroundColor = selected ? ViewMetrics.backgroundColorLineViewIsSelected : ViewMetrics.backgroundColorLineView
    }
}
