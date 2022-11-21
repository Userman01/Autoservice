//
//  ThemeColor.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 06.11.2022.
//

import UIKit

extension UIColor {
    
    static func dynamic(light: UIColor!, dark: UIColor!) -> UIColor? {
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light}
    }
}
