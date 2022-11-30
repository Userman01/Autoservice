//
//  APIClient.swift
//  BVCAutoservice
//
//  Created by Петр Постников on 30.11.2022.
//

import Foundation
import Alamofire

enum AuthType {
    case BVC
}

final class APIClient {
    
    func post<T: Decodable>(_ url: String, parameters: [String: Any]? = nil, model: T.Type, authType: AuthType? = nil, completion: @escaping (RequestResult<T>) -> Void) {
        request(url, method: .post, model: model, completion: completion)
    }
}

extension APIClient {
    
    private func request<T: Decodable>(_ url: String, method: HTTPMethod, parameters: [String: Any]? = nil, model: T.Type, authType: AuthType? = nil, completion: @escaping (RequestResult<T>) -> Void) {
        let sessionManager = getSessionManager(authType: authType)
        print("""
              URL: \(url)
              METHOD: \(method)
              """)
        sessionManager.request(url, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: model) { response in
                switch response.result {
                case .success:
                    if let jsonData = response.data {
                        let result = self.parseJSON(data: jsonData, model: model.self, url: url, response: response)
                    }
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    private func getSessionManager(authType: AuthType?, isUpload: Bool = false) -> Session {
        switch authType {
        case .BVC:
            return NetworkSession.manager
        case .none:
            return NetworkSession.manager
        }
    }
    
    private func parseJSON<T: Decodable>(data: Data, model: T.Type, url: String, response: DataResponse<T, AFError>) -> RequestResult<T> {
        let jsonDecoder = JSONDecoder()
        do {
            let result = try jsonDecoder.decode(model.self, from: data)
            return .success(result)
        } catch let error {
            return .failure(NetworkError(error: error))
        }
    }
}
