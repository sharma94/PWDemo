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
    
    private var cancellables: AnyCancellable?
    
    init() {
        getFacts()
    }

    func getFacts() {

        self.isLoading = true
        cancellables = FactsAPI.request(.facts)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
            
            },
                receiveValue: {
                    self.title = $0.title
                    self.factDetails = $0.rows
                    self.isLoading = false
            })
    }
    
}
