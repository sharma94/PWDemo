//
//  FactsAPI.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import Foundation
import Combine

enum FactsAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/")!
}

enum APIPath: String {
    case facts  = "facts.json"
}

extension FactsAPI {
    static func request(_ path: APIPath) -> AnyPublisher<FactsResponse, Error> {
            
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                else { fatalError("Couldn't create URLComponents") }
            
            let request = URLRequest(url: components.url!)
            
            return apiClient.run(request)
                .map(\.value)
                .eraseToAnyPublisher()
        }
}
