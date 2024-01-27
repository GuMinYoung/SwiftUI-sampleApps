//
//  SymbolPicker.swift
//  EditingGrids
//
//  Created by 구민영 on 1/25/24.
//

import SwiftUI

struct SymbolPicker: View {
    // @State와 @Binding을 사용해서 view를 닫는 방법
    @Binding var isShowSheet : Bool
    
    // 환경변수를 사용해서 view를 닫는 방법도 있다.
    // @Environment(\.dismiss) private var dismiss
    
    private let gridColumns = Array(repeating: GridItem(.flexible()), count: 4)
    @Binding var symbol: Symbol?
    
    let pickableSymbols = [
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
        Symbol(name: "house.fill"),
        Symbol(name: "sun.max.fill"),
        Symbol(name: "cloud.rain.fill"),
        Symbol(name: "pawprint.fill"),
        Symbol(name: "lungs.fill"),
        Symbol(name: "face.smiling"),
        Symbol(name: "gear"),
        Symbol(name: "allergens"),
        Symbol(name: "bolt.heart"),
        Symbol(name: "ladybug.fill"),
        Symbol(name: "bus.fill"),
        Symbol(name: "bicycle.circle"),
        Symbol(name: "faceid"),
        Symbol(name: "gamecontroller.fill"),
        Symbol(name: "timer"),
        Symbol(name: "eye.fill"),
        Symbol(name: "person.icloud"),
        Symbol(name: "tortoise.fill"),
        Symbol(name: "hare.fill"),
        Symbol(name: "leaf.fill"),
        Symbol(name: "wand.and.stars"),
        Symbol(name:"globe.americas.fill"),
        Symbol(name: "globe.europe.africa.fill"),
        Symbol(name: "globe.asia.australia.fill"),
        Symbol(name: "hands.sparkles.fill"),
        Symbol(name: "hand.draw.fill"),
        Symbol(name: "waveform.path.ecg.rectangle.fill"),
        Symbol(name: "gyroscope"),
        
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns) {
                ForEach(pickableSymbols) { symbol in
                    Button {
                        self.symbol = symbol

                        // EditingGird의 isAddingSymbol과 바인딩
                        isShowSheet.toggle()
                        
                        // 환경변수 사용해서 현재 뷰 닫기
                        // dismiss()
                    } label: {
                        Image(systemName: symbol.name)
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.blue)
                    }.padding()
                        
                }
            }.onAppear {
                self.symbol = nil
                // 컬렉션에 비정상 항목 추가되는 버그 개선을 위함 (애플 튜토리얼 소스에서도 동일하게 발생)
                // [버그 재현 스탭]
                //  1. 네비게이션 우측 + 버튼으로 SymbolPicker 띄우기
                //  2. 임의의 symbol 클릭해서 EditingGrid에 symbol 추가
                //  3. 네비게이션 우측 + 버튼으로 SymbolPicker 띄우기
                //  4. 버튼이 아닌 여백을 클릭해서 하단으로 스와이프하여 SymbolPicker 닫기
                // [기대 결과] - EditingGrid에 추가되는 symbol 없음
                // [실제 결과] - EditingGrid에 빈 칸이 추가됨
                // [발생 사유]
                //  - SymbolPicker가 present 될 때 self.symbol이 이전에 선택한 symbol로 설정되어 있기 때문.
                //  (스탭 3 시점에서 self.symbol이 nil이 아니라 2에서 선택한 symbol로 남아있음)
                //  - 그래서 EditingGrid의 LazyVGrid에 id까지 완전히 동일한 데이터가 들어가게 되어
                //  "LazyVGridLayout: the ID \(symbol.id) is used by multiple child views, this will give undefined results!" 에러 문구가 출력된다.
                //  - symbol.id 예시) 5559E83E-4F31-4068-9FF3-DD5B1CEEBBEA
                // [수정 방향]
                //  SymbolPicker가 present 될 때 self.symbol을 nil로 초기화하면,
                //  선택한 symbol 없이 화면이 닫혔을 때 EditingGrid의 addSymbol 메서드 내부 guard 문에서 걸러지므로
                //  LazyVGrid에 비정상 데이터가 추가되지 않는다.
            }
        }
    }
}

#Preview {
    SymbolPicker(isShowSheet: .constant(true), symbol: .constant(nil))
}

/*
 1. @Binding
 - 자식 뷰에서 @Binding이 붙은 특정 property 값이 변경되면 부모 뷰에서 @State가 붙은 특정  property 값도 변경한다.
 - 이 예제에서는 SymbolPicker의 (@Bindig)isShowSheet과 EditingGrid의 (@state)isAddingSymbol에 해당
 
 2. 환경변수
 - 무엇이 있는지, 호출될 때 각 뷰에서 어떤 현상이 일어나는지 (해당 환경변수를 사용하는 모든 뷰에서 부분이 아닌 전체 영역이 reload 된다거나.. 아래 래퍼런스 참고)
 - ref) https://huniroom.tistory.com/entry/SwiftUI-Environment%EC%99%80-dismiss%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%98%EB%8A%94-%EC%98%AC%EB%B0%94%EB%A5%B8-%EB%B0%A9%EB%B2%95
 
 3. 라이프사이클
 - onAppear,onDisappear 등
 */
