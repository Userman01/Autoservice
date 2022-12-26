//
//  RequestResult.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

enum RequestResult<T> {
    case success(T)
    case failure(NetworkError)
}
