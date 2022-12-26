//
//  PhoneValidator.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 29.11.2022.
//

import UIKit

struct PhoneValidator: ValidatorProtocol {
    
    func validated(_ value: String) throws -> String {
        guard Int(value) != nil && value.count == 11 else {
            throw ValidatorError()
        }
        return value
    }
}
