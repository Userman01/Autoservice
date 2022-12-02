//
//  PassportCreateIndicatorView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 02.12.2022.
//

import UIKit

final class PassportCreateIndicatorView: UIView {
    
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .dynamic(light: R.color.blue(), dark: R.color.blue())
        static let borderColor: UIColor! = .dynamic(light: R.color.blue(), dark: R.color.blue())
        static let borderWith: CGFloat = 1.0
        static let cornerRadius: CGFloat = 8.0
    }
    
    enum PassportCreateIndicatorState {
        case unfilled
        case filled
    }
    
    var state: PassportCreateIndicatorState = .unfilled {
        didSet {
            switch state {
            case .unfilled:
                layer.borderWidth = ViewMetrics.borderWith
                layer.borderColor = ViewMetrics.borderColor.cgColor
            case .filled:
                backgroundColor = ViewMetrics.backgroundColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        layer.cornerRadius = ViewMetrics.cornerRadius
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 16, height: 16)
    }
}
