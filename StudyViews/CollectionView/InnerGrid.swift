//
//  InnerGrid.swift
//  StudyViews
//
//  Created by Kyle Ozaltug on 2019-10-20.
//  Copyright © 2019 Kyle Ozaltug. All rights reserved.
//

import SwiftUI

struct InnerGrid<Content>: View where Content: View {
    
    private let spacing: CGFloat
    private let rows: [[Int]]
    private let alignment: HorizontalAlignment
    private let content: (Int, CGFloat) -> Content
    private let columnWidth: CGFloat
    
    init(
        spacing: CGFloat,
        items: [Int],
        alignment: HorizontalAlignment = .leading,
        @ViewBuilder content: @escaping (Int, CGFloat) -> Content,
        gridDefinition: GridCalculator.GridDefinition
    ) {
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
        self.columnWidth = gridDefinition.columnWidth
        rows = items.chunked(into: gridDefinition.columnCount)
    }
    
    var body : some View {
        ScrollView(.vertical) {
            VStack(alignment: alignment, spacing: spacing) {
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: self.spacing) {
                        ForEach(row, id: \.self) { item in
                            // Pass the index and the cell width to the content
                            self.content(item, self.columnWidth)
                                .frame(width: self.columnWidth)
                        }
                    }.padding(.horizontal, self.spacing)
                }
            }.padding(.top, spacing)
        }
    }
}

struct InnerGrid_Previews: PreviewProvider {
    static var previews: some View {
        InnerGrid(spacing: 2, items: [111], alignment: .leading, content: { index, cellWidth in
            Text("\(index)")
                .foregroundColor(.white)
                .frame(width: cellWidth, height: cellWidth * 0.66)
                .background(Color.blue)
        }, gridDefinition: (200, 130))
    }
}
