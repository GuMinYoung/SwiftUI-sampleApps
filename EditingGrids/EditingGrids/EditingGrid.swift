//
//  ContentView.swift
//  EditingGrids
//
//  Created by 구민영 on 1/25/24.
//

import SwiftUI

struct EditingGrid: View {
    private static let initialColumnCount = 3
    @State private var gridItems = Array(repeating: GridItem(.flexible()), count: initialColumnCount)
    @State private var columnCount: Int = initialColumnCount
    @State private var symbols = [
        Symbol(name: "tshirt"),
        Symbol(name: "eyes"),
        Symbol(name: "eyebrow"),
        Symbol(name: "nose"),
        Symbol(name: "mustache"),
        Symbol(name: "mouth"),
        Symbol(name: "eyeglasses"),
        Symbol(name: "facemask"),
        Symbol(name: "brain.head.profile"),
        Symbol(name: "brain"),
        Symbol(name: "icloud"),
        Symbol(name: "theatermasks.fill"),
    ]
    private var stepperTitle: String {
        let base = "\(columnCount) "
        return columnCount > 1 ? base + "Columns" : base + "Column"
    }
    
    var body: some View {
        VStack {
            Stepper(stepperTitle, value: $columnCount, in: 1...6) {_ in
                withAnimation {
                    gridItems = initGridItems(count: columnCount)
                }
            }.padding()
            
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(symbols) { symbol in
                        Image(systemName: symbol.name)
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                    }
                }

            }
        }
    }
    
    //@ViewBuilder
    func initGridItems(count :Int) -> [GridItem] {
        return Array(repeating: GridItem(.flexible()), count: count)
    }
}

#Preview {
    EditingGrid()
}
