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
    @Published var isLoading = false
    @Published private(set) var activeError: NetworkError?
    private var cancellables: AnyCancellable?
    
    @Published var hasError: Bool = false
    
    init() {
        getFacts()
    }
    @Published var error: NetworkError?

    func getFacts() {
        self.isLoading = true
        cancellables = FactsAPI.request(.facts)
            .mapError({ (error) -> Error in
                self.hasError = true
                self.activeError = error as? NetworkError
               // print(self.activeError?.localizedDescription as Any)
                return error
            })
            .sink(receiveCompletion: {_ in
            }, receiveValue: {
                    self.title = $0.title
                    self.factDetails = $0.rows
                    self.isLoading = false
            })
    }
}


