//
//  DirectionalLayoutMargins.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 27.12.2022.
//

import UIKit

extension UIView {
    func setDirectionalLayoutMargins(_ margins: NSDirectionalEdgeInsets) {
        self.preservesSuperviewLayoutMargins = false
        self.directionalLayoutMargins = margins
    }
}
