//
//  GestureRowView.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/24/24.
//

import SwiftUI

struct GestureRowView: View {
    let info: ListRowInfo
    
    init(with info: ListRowInfo) {
        self.info = info
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: info.systemImage)
                    .frame(width: 30)
                    .font(.title)
                    .foregroundStyle(Color.accentColor)
                
                VStack(alignment: .leading) {
                    Text(info.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 2)
                    Text(info.description)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(10)
            }
        }
    }
}
