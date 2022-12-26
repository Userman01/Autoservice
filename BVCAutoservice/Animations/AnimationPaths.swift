//
//  AnimationPaths.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import UIKit
import Lottie

enum AnimationType {
    
    // В обработке
    case inProgress

    static func getAnimation(of animationType: AnimationType, for traitCollection: UITraitCollection) -> LottieAnimation! {
        let isDark = traitCollection.userInterfaceStyle == .dark
        var path: String?
        
        switch animationType {
        case .inProgress:
            path = isDark ? R.file.preloaderJson.path() : R.file.preloaderJson.path()
            return LottieAnimation.filepath(path ?? "")
        }
    }
}
