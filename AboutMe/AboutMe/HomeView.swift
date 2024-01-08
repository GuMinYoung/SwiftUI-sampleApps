//
//  HomeView.swift
//  AboutMe
//
//  Created by 구 민영 on 2024/01/07.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            Text("All About")
                .font(.system(size: 35, weight: .bold, design: .rounded))
                .background(.yellow)
                .padding()
                .background(.pink)
            
            Image(information.image)
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .padding(40)
            
            Text(information.name)
                .font(.title)
        }
    }
    
}

#Preview {
    HomeView()
}
