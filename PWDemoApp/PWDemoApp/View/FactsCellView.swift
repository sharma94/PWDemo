//
//  FactsCellView.swift
//  PWDemoApp
//
//  Created by R M Sharma on 13/06/21.
//

import SwiftUI

struct FactsCellView: View {
    var factData: FactDetails
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            VStack(alignment: .leading, spacing:10) {

                    RemoteImage(url: factData.imageHref ?? "")
                        .aspectRatio(contentMode: .fit)
                      
                    Text(factData.title ?? "")
                        .fontWeight(.bold)
                    Text(factData.description ?? "")
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
            }
        }
    }
}

struct FactsCellView_Previews: PreviewProvider {
    static var previews: some View {
        FactsCellView(factData: FactDetails(title: "Transportation",
                                            description: "It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.",
                                            imageHref: "http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg"))
    }
}
