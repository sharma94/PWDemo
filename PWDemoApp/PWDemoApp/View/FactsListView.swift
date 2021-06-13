//
//  FactsListView.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import SwiftUI
import Foundation
import Combine


struct FactsListView: View {
    @ObservedObject var factsListVM: FactsListViewModel = FactsListViewModel()
    
    var body: some View {
    
        NavigationView {
            List{
                ForEach(factsListVM.factDetails, id: \.self) { data in
                          FactsCellView(factData: data)
                       }
            }
        }.navigationBarTitle(factsListVM.title)
    }
}

struct FactsListView_Previews: PreviewProvider {

    static var previews: some View {
        FactsListView(factsListVM: FactsListViewModel())
    }
}
