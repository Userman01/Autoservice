//
//  NetworkError.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation

struct NetworkError {

    let errorMessage: String
    let errorModel: Decodable?
    let response: HTTPURLResponse?
    let error: Error?

    init(errorMessage: String = R.string.localizable.commonErrorMessage(),
         errorModel: Decodable? = nil,
         response: HTTPURLResponse? = nil,
         error: Error? = nil) {
        self.errorMessage = errorMessage
        self.errorModel = errorModel
        self.response = response
        self.error = error
    }
}
