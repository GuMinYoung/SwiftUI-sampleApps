//
//  ContentView.swift
//  EditingGrids
//
//  Created by 구민영 on 1/25/24.
//

import SwiftUI

struct EditingGrid: View {
    private static let initialColumnCount = 3
    @State private var isAddingSymbol = false
    @State private var selectedSymbol: Symbol?
    @State private var isEditing = false
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
            if isEditing {
                Stepper(stepperTitle, value: $columnCount, in: 1...6) {_ in
                    withAnimation {
                        gridItems = initGridItems(count: columnCount)
                    }
                }
                .padding()
            }
            
            ScrollView {
                    LazyVGrid(columns: gridItems) {
                        ForEach(symbols) { symbol in
                            NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                                ZStack(alignment: .topTrailing) {
                                    Image(systemName: symbol.name)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                    
                                    if isEditing {
                                        Button {
                                            guard let index = symbols.firstIndex(of: symbol) else {return}
                                            withAnimation {
                                                _ = symbols.remove(at: index)
                                            }
                                        } label: {
                                            Image(systemName: "xmark.square.fill")
                                                .font(.system(size: 25))
                                                .foregroundStyle(.white, .red)
                                                .padding(.top, -7)
                                        }
                                    }
                                }
                                .padding()
                            }
                    }
                }
            }
        }
        .navigationTitle("My Symbols")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingSymbol, onDismiss: addSymbol) {
            SymbolPicker(isShowSheet: $isAddingSymbol, symbol: $selectedSymbol)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingSymbol = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(isEditing)
            }
        }

    }
    
    func initGridItems(count :Int) -> [GridItem] {
        return Array(repeating: GridItem(.flexible()), count: count)
    }
    
    func addSymbol() {
        guard let name = selectedSymbol else { return }
        withAnimation {
            symbols.insert(name, at: 0)
        }
    }
}

#Preview {
    EditingGrid()
}
