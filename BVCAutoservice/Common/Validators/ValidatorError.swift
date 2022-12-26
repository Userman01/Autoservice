//
//  ValidatorError.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 29.11.2022.
//

import Foundation

final class ValidatorError: Error {
    
    let message: String
    
    init(_ message: String = "") {
        self.message = message
    }
}
