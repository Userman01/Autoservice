//
//  Array.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 23.11.2022.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        indices ~= index ? self[index] : nil
    }
}
