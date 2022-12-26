//
//  AlertController.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import UIKit

extension UIViewController {
    
    func alert(title: String? = "", message: String? = "", okTitle: String = R.string.localizable.commonOK()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: okTitle, style: .default))
        self.present(alertController, animated: true)
    }
}
