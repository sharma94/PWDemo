//
//  FactsListViewModel.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import Foundation
import Combine

class FactsListViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var factDetails:[FactDetails] = [FactDetails]()
    
    init() {
        loadData()
    }
    
    func loadData() {
            guard let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") else {
                print("Your API end point is Invalid")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in

                if let error = error {
                        print("Error with fetching photos: \(error)")
                        return
                }
                
                guard let data = data else { return }
                
                guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
                
                guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
                
                do{
                        let facts = try JSONDecoder().decode(Facts.self, from: properData)
                        //dump(facts)
                            DispatchQueue.main.async {
                           
                                self.title = facts.title
                                self.factDetails = facts.rows
                            }

                        } catch let jsonError as NSError {
                            print("JSON decode failed: \(jsonError.localizedDescription)")
                        }

             }.resume()
        }
}
