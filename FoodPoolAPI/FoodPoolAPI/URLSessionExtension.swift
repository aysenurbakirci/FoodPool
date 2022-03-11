//
//  URLSessionExtension.swift
//  FoodPoolAPI
//
//  Created by Ayşenur Bakırcı on 11.03.2022.
//

import Foundation
import RxSwift
import RxCocoa

public enum RxURLSessionError: Error {
    case unknown
    case requestFailed(response: HTTPURLResponse, data: Data?)
}

extension Reactive where Base: URLSession {
    
    func decodable<D: Decodable>(request: URLRequest, type: D.Type) -> Observable<D> {
        return response(request: request)
            .map { response, data -> Data in
            guard 200 ..< 300 ~= response.statusCode else {
                throw RxURLSessionError.requestFailed(response: response, data: data)
            }
            return data
        }.map { data in
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        }
    }
}
