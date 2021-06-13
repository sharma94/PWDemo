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
        Text(factsListVM.title)
    }
}

struct FactsListView_Previews: PreviewProvider {

    static var previews: some View {
        FactsListView(factsListVM: FactsListViewModel())
    }
}
