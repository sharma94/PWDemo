//
//  FactsListView.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import SwiftUI
import Foundation


struct FactsListView: View {
    
    @ObservedObject var factsListVM: FactsListViewModel = FactsListViewModel()
    
    var body: some View {
    
        NavigationView {
            List{
                ForEach(factsListVM.factDetails, id: \.title) { data in
                          FactsCellView(factData: data)
                       }
                
            }.navigationBarItems(trailing:
                Button(action: { factsListVM.loadData() }
                ) {
                Image(systemName: "arrow.clockwise")
              })
            .navigationBarTitle(factsListVM.title, displayMode: .inline)
            .background(Color.clear)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FactsListView_Previews: PreviewProvider {

    static var previews: some View {
        FactsListView(factsListVM: FactsListViewModel())
    }
}
