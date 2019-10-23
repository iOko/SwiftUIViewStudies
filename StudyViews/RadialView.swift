//
//  RadialView.swift
//  StudyViews
//
//  Created by Kyle Ozaltug on 2019-08-05.
//  Copyright © 2019 Kyle Ozaltug. All rights reserved.
//

import SwiftUI

struct RadialView : View {
    var body: some View {
        let cyan = Color.init(red: 0.2, green: 0.9, blue: 0.9)
        let spectrum = Gradient(colors: [.red, .yellow, .green, cyan, .blue, .purple, .red])
        let conic = AngularGradient(gradient: spectrum, center: .center, angle: .degrees(-90))
       
        return
            Circle().strokeBorder(conic, lineWidth: 50)
    }
}

#if DEBUG
struct RadialView_Previews : PreviewProvider {
    static var previews: some View {
        RadialView()
    }
}
#endif


class Ring {
    struct Wedge {
        var width: Double
        var depth: Double
        var hue: Double
    }
    
    var wedges: [Int: Wedge] = [:]
    var wedgeIds: [Int] = []
}

//struct WedgeShape: Shape {
//
//    var wedge: Ring.Wedge
//
//    func path(in rect: CGRect) -> Path {
//        var p = Path()
//        let g = WedgeGeometry(wedge, in: rect)
//
//
//        return p
//    }
//}
