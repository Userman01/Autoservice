//
//  LoadingBackgroundView.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import UIKit

final class LoadingBackgroundView: UIView {
    
    private enum ViewMetrics {
        static let backgroundColor: UIColor! = .backgroundColor?.withAlphaComponent(0.8)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ViewMetrics.backgroundColor
        alpha = 0.0
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
