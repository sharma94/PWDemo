//
//  FactsModel.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import Foundation

struct Facts: Codable {
    var title: String
    var rows: [FactDetails]
}

struct FactDetails: Codable, Hashable {
    var title: String?
    var description: String?
    var imageHref: String?
}
