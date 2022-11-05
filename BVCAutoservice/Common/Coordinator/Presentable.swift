//
//  Presentable.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 03.11.2022.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}

protocol BaseModule: NSObjectProtocol, Presentable {}
