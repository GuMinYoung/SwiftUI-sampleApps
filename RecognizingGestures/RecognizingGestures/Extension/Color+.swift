//
//  Color+.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/24/24.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
