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
    @State var showAlert = false
    
    var body: some View {
    
        NavigationView {
            Group {
                if factsListVM.isLoading {
                    if #available(iOS 14.0, *) {
                        ProgressView()
                            .scaleEffect(2.5, anchor: .center)
                            .progressViewStyle(CircularProgressViewStyle(tint: .secondary))
                    }
                    else {
                        ProgressIndicator(isAnimating: .constant(true), style: .large)
                    }
                   

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
            .navigationBarTitle(Text(factsListVM.title), displayMode: .inline)
            //.navigationBarTitle(factsListVM.title, displayMode: .inline)
            .background(Color.clear)
            
        }.navigationViewStyle(StackNavigationViewStyle())
        .alert(isPresented: $factsListVM.hasError, content: {
                    Alert(title: Text("Error"),
                          message: Text(factsListVM.activeError?.localizedDescription ?? ""),
                          primaryButton: .default(Text("Retry")) {
                            factsListVM.getFacts()
                          }, secondaryButton: .cancel())
                })
    }
    
}

struct FactsListView_Previews: PreviewProvider {

    static var previews: some View {
        FactsListView(factsListVM: FactsListViewModel())
    }
}
