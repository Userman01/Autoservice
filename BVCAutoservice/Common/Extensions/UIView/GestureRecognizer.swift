//
//  GestureRecognizer.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 28.11.2022.
//

import UIKit

extension UIView {
    
    func addGestureRecognizerEndEditing(delegate: UIGestureRecognizerDelegate? = nil) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = delegate
        addGestureRecognizer(tapGesture)
    }
}
