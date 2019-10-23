//
//  CollectionView.swift
//  StudyViews
//
//  Created by Kyle Ozaltug on 2019-10-20.
//  Copyright © 2019 Kyle Ozaltug. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        VStack {
            Text("Hello World!")
            
            GridStack(minCellWidth: 200, spacing: 2, numItems: 15) { index, cellWidth in
                Text("\(index)")
                    .foregroundColor(.white)
                    .frame(width: cellWidth, height: cellWidth * 0.66)
                    .background(Color.blue)
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}

public struct GridStack<Content>: View where Content: View {

    private let minCellWidth: CGFloat
    private let spacing: CGFloat
    private let numItems: Int
    private let alignment: HorizontalAlignment
    private let content: (Int, CGFloat) -> Content
    private let gridCalculator = GridCalculator()
    
    public init(
        minCellWidth: CGFloat,
        spacing: CGFloat,
        numItems: Int,
        alignment: HorizontalAlignment = .leading,
        @ViewBuilder content: @escaping (Int, CGFloat) -> Content
    ) {
        self.minCellWidth = minCellWidth
        self.spacing = spacing
        self.numItems = numItems
        self.alignment = alignment
        self.content = content
    }
    
    var items: [Int] {
        Array(0..<numItems).map { $0 }
    }
    
    public var body: some View {
        GeometryReader { geometry in
            InnerGrid(
                spacing: self.spacing,
                items: self.items,
                alignment: self.alignment,
                content: self.content,
                gridDefinition: self.gridCalculator.calculate(
                    availableWidth: geometry.size.width,
                    minimumCellWidth: self.minCellWidth,
                    cellSpacing: self.spacing
                )
            )
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
