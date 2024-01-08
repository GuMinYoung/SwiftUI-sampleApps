//
//  FunFactsView.swift
//  AboutMe
//
//  Created by 구 민영 on 2024/01/07.
//

import SwiftUI

struct FunFactsView: View {
    /*
     SwiftUI의 @State 관련 래퍼런스
     1.
     https://seons-dev.tistory.com/entry/SwiftUI-State%EC%97%90-%EB%8C%80%ED%95%B4-%EC%9E%90%EC%84%B8%ED%9E%88-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0
     
     2.
     https://huniroom.tistory.com/entry/SwiftUI-state-property
    */
    
    @State private var funFact = ""
    
    var body: some View {
        VStack {
            Text("FunFacts")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(funFact)
                .padding()
                .background(.white)
                .font(.title)
                .frame(minHeight: 400)
                .background(.purple)
            
            Button("Show Random Fact") {
                guard let randomFunFact = information.funFacts.randomElement() else {return}
                
                funFact = randomFunFact
            }
            .foregroundStyle(.purple)
        }
    }
    
}

#Preview {
    FunFactsView()
}
