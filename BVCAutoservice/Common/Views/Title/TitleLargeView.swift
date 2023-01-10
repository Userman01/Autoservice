//
//  TitleLargeView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 09.01.2023.
//

import UIKit
import SnapKit

class TitleLargeView: UIView {
    
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColorLargeTitle
        static let textColor: UIColor! = .dynamic(light: R.color.white(), dark: R.color.white())
        static let insetsSize = NSDirectionalEdgeInsets(top: .zero, leading: .spacing16Pt, bottom: .spacing16Pt, trailing: .spacing16Pt)
    }
    
    enum TitleLargeType {
        case primary
    }
    
    var titleLargeType: TitleLargeType
    
    private lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.font = .font24RegularNeuropol
        label.adjustsFontForContentSizeCategory = true
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionlabel: UILabel = {
        let label = UILabel()
        label.font = .font14Regular
        label.numberOfLines = 0
        label.textColor = ViewMetrics.textColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(frame: CGRect = .zero, titleLargeType: TitleLargeType = .primary) {
        self.titleLargeType = titleLargeType
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        switch titleLargeType {
        case .primary:
            backgroundColor = ViewMetrics.backgroundColor
            setDirectionalLayoutMargins(ViewMetrics
                .insetsSize)
            
            addSubview(titlelabel)
            addSubview(descriptionlabel)
            
            titlelabel.snp.makeConstraints { make in
                make.top.equalTo(safeAreaLayoutGuide.snp.top)
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(CGFloat.spacing60Pt)
            }
            
            descriptionlabel.snp.makeConstraints { make in
                make.top.equalTo(titlelabel.snp.bottom).offset(CGFloat.spacing16Pt)
                make.left.equalTo(layoutMarginsGuide)
                make.right.equalTo(layoutMarginsGuide)
                make.bottom.equalTo(layoutMarginsGuide)
            }
        }
    }
    
    func configure(title: String, description: String) {
        switch titleLargeType {
        case .primary:
            titlelabel.text = title
            descriptionlabel.text = description
        }
    }
}
