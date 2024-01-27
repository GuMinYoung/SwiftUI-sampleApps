//
//  SymbolDetail.swift
//  EditingGrids
//
//  Created by 구민영 on 1/25/24.
//

import SwiftUI

struct SymbolDetail: View {
    var symbol: Symbol
    
    var body: some View {
        VStack {
            Text(symbol.name)
                .font(.system(.largeTitle,  design: .rounded))
                      
            Image(systemName: symbol.name)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.blue)
        }
        .padding()
    }
}

#Preview {
    SymbolDetail(symbol: Symbol(name: "magnifyingglass"))
}
