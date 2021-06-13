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
    @State private var isLoading = false
    
    var body: some View {
    
        NavigationView {
            Group {
                if factsListVM.isLoading {
                    ProgressView()
                        .scaleEffect(2.5, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .secondary))

                } else {
                    List{
                        ForEach(factsListVM.factDetails, id: \.title) { data in
                            FactsCellView(factData: data)
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    factsListVM.getFacts()
                }) {
                Image(systemName: "arrow.clockwise")
                }).disabled(isLoading)
            
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
