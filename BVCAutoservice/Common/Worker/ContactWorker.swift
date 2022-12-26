//
//  ContactWorker.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.12.2022.
//

import Foundation

enum PhoneNumberFormat {
    case separate
}

protocol ContactWorkerProtocol {
    
    func getFormattedPhoneNumber(_ number: String, format: PhoneNumberFormat) -> String
}

final class ContactWorker: ContactWorkerProtocol {
    
    func getFormattedPhoneNumber(_ number: String, format: PhoneNumberFormat) -> String {
        switch format {
        case .separate:
            return number.masked(pattern: "+X\u{00A0}(XXX)\u{00A0}XXX-XX-XX", replacementCharacter: "X")
        }
    }
}
