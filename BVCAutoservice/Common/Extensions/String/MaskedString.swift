//
//  MaskedString.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 05.12.2022.
//

import Foundation

extension String {

    func masked(pattern: String, replacementCharacter: Character) -> String {
        var string = ""
        var index = self.startIndex
        for char in pattern {
            if index == self.endIndex {
                break
            }
            if char == replacementCharacter {
                string.append(self[index])
                index = self.index(after: index)
            } else {
                string.append(char)
            }
        }
        return string
    }
}
