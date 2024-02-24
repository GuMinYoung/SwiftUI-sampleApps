//
//  GestureType.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/24/24.
//

import SwiftUI

enum GestureType {
    case tap
    case touchAndHold
    case drag
    case rotate
    case lineDrawing
    
    var rowInfo: ListRowInfo {
        switch self {
        case .tap:
            return ListRowInfo(title: "Tap", description: "Tap a shape to interact with it.", systemImage: "hand.point.up.left")
        case .touchAndHold:
            return ListRowInfo(title: "Touch and Hold", description: "Touch and hold a shape to interact with it.", systemImage: "hand.tap")
        case .drag:
            return ListRowInfo(title: "Drag", description: "Drag a shape using one finger", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
        case .rotate:
            return ListRowInfo(title: "Rotate", description: "Rotate a shape with two fingers.", systemImage: "arrow.triangle.2.circlepath")
        case .lineDrawing:
            return ListRowInfo(title: "Line Drawing", description: "Use your finger to draw a simple line shape.", systemImage: "pencil.tip")
        }
    }
    
    var navigationTitle: String {
        String(describing: self).capitalized    // 케이스명의 맨 앞 문자를 대문자로
    }
}

struct ListRowInfo {
    let title: String
    let description: String
    let systemImage: String
}
