//
//  ActionButton.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.11.2022.
//

import UIKit

class ActionButton: UIButton {
    
    private enum ViewMetrics {
        static let primaryTitleColor: UIColor! = .dynamic(light: R.color.primaryTitleColorLight(), dark: R.color.primaryTitleColorDark())
        
        static let primaryBackgroundColor: UIColor! = .dynamic(light: R.color.primaryBackgroundColorLight(), dark: R.color.primaryBackgroundColorDark())
        static let primaryHighlightedColor: UIColor! = .dynamic(light: R.color.primaryHighlightedColorLight(), dark: R.color.primaryHighlightedColorDark())
        static let secondBackgroundColor: UIColor! = .dynamic(light: R.color.primaryBackgroundColorLight(), dark: R.color.blue())
        static let secondHighlightedColor: UIColor! = .dynamic(light: R.color.primaryHighlightedColorLight(), dark: R.color.lightBlue())
        static let heightNormal: CGFloat = 56.0
        static let cornerRadius: CGFloat = 28.0
        static let secondCornerRadius: CGFloat = 5.0
    }
    
    enum ButtonStyle {
        case primary
        case second
    }
    
    enum ButtonHeightType {
        case normal
    }
    
    var buttonStyle: ButtonStyle
    var heightType: ButtonHeightType
    
    required init(
        frame: CGRect = .zero,
        style: ButtonStyle = .primary,
        heightType: ButtonHeightType = .normal,
        title: String? = nil
    ) {
        self.buttonStyle = style
        self.heightType = heightType
        super.init(frame: frame)
        setup(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(title: String? = nil) {
        switch buttonStyle {
        case .primary:
            titleLabel?.font = .font16RegularNeuropol
            titleLabel?.adjustsFontForContentSizeCategory = true
            setTitleColor(ViewMetrics.primaryTitleColor, for: .normal)
            setTitle(title, for: .normal)
            backgroundColor = ViewMetrics.primaryBackgroundColor
            layer.cornerRadius = ViewMetrics.cornerRadius
        case .second:
            titleLabel?.font = .font16Regular
            setTitleColor(ViewMetrics.primaryTitleColor, for: .normal)
            setTitle(title, for: .normal)
            backgroundColor = ViewMetrics.secondBackgroundColor
            layer.cornerRadius = ViewMetrics.secondCornerRadius
        }
    }

    override var intrinsicContentSize: CGSize {
        switch heightType {
        case .normal:
            return CGSize(width: frame.size.width, height: ViewMetrics.heightNormal)
        }
    }
    
    func setButtonStyle(_ style: ButtonStyle) {
        buttonStyle = style
        setup(title: titleLabel?.text)
    }
}
extension ActionButton {
    
    override var isEnabled: Bool {
        didSet {
            if buttonStyle == .primary {
                backgroundColor = isEnabled ? ViewMetrics.primaryBackgroundColor : ViewMetrics.primaryHighlightedColor
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            switch buttonStyle {
            case .primary:
                backgroundColor = isHighlighted ? ViewMetrics.primaryHighlightedColor : ViewMetrics.primaryBackgroundColor
            case .second:
                backgroundColor = isHighlighted ? ViewMetrics.secondHighlightedColor : ViewMetrics.secondBackgroundColor
            }
        }
    }
}
