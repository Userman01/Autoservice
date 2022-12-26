//
//  LoadingAnimation.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import UIKit

extension UIViewController {
    
    func startFullScreenAnimatingIndicator(backgroundView: LoadingBackgroundView = LoadingBackgroundView(), indicatorView: AnimatingIndicator = LoadingIndicatorView()) {
        guard let applicationDelegate: SceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate,
              let window: UIWindow = applicationDelegate.window else { return }
        window.startAnimatingIndicator(backgroundView: backgroundView, indicatorView: indicatorView)
    }
    
    func stopFullScreenAnimatingIndicator() {
        guard let applicationDelegate: SceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate,
              let window: UIWindow = applicationDelegate.window else { return }
        window.stopAnimatingIndicator()
    }
}
