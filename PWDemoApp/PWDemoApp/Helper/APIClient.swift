//
//  APIClient.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import Foundation
import Combine

struct APIClient {
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Codable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .mapError { NetworkError.request(underlyingError: $0) }
            .tryMap { result -> Response<T> in
                //modify data to proper format
                let string = String(data: result.data, encoding:String.Encoding.isoLatin1)
                let properData = string?.data(using: .utf8, allowLossyConversion: true)
                
                let value = try JSONDecoder().decode(T.self, from: properData ?? result.data)
                return Response(value: value, response: result.response)
            }
            
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}

enum NetworkError: LocalizedError, Identifiable {
    case badUrl
    case notFound
    case serverError(responseCode: Int)
    case request(underlyingError: Error)
    case unknown

    var id: String { localizedDescription }

    var errorDescription: String? {
        switch self {
        case .badUrl: return "Bad URL"
        case .notFound: return "Not found"
        case .serverError(let responseCode): return "Server error \(responseCode)"
        case .request(let error): return error.localizedDescription
        case .unknown: return "Unknown error"
        }
    }
}
