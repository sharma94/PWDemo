//
//  FactsModel.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import Foundation

struct FactsResponse: Codable {
    var title: String
    var rows: [FactDetails]
}

struct FactDetails: Codable {
    var title: String?
    var description: String?
    var imageHref: String?
}
