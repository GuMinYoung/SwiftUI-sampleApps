//
//  IncludeGestureProtocol.swift
//  RecognizingGestures
//
//  Created by 구민영 on 2/24/24.
//

protocol IncludeGesture {
    associatedtype SomeGesture
    var gesture: SomeGesture { get }
    var gestureType: GestureType { get set }
}
