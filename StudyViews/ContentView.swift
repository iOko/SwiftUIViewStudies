//
//  ContentView.swift
//  StudyViews
//
//  Created by Kyle Ozaltug on 2019-08-05.
//  Copyright © 2019 Kyle Ozaltug. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        HStack(alignment: .midStarAndTitle, spacing: 20) {
            VStack {
                Text("✮✮✮✮✮")
                    .alignmentGuide(.midStarAndTitle) { d -> CGFloat in
                        d[.bottom] / 2
                }
                Text("5 stars")
            }
                .background(Color.yellow)
                .font(.headline)
            
            VStack {
                HStack(spacing: 10) {
                    Text("Avocado Toast")
                        .alignmentGuide(.midStarAndTitle) { d -> CGFloat in
                            let x =
                            d[.bottom] / 2
                            return x
                    }
                    Spacer()
                    Text("🥑")

                }
                Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper")
                
            }
                .background(Color.orange)
                .font(.subheadline)
            
        }
            .padding()
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


extension VerticalAlignment {
    private enum MidStarAndTitle : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.bottom]
        }
    }
    static let midStarAndTitle = VerticalAlignment(MidStarAndTitle.self)
}
