//
//  File.swift
//  
//
//  Created by 김인섭 on 12/12/23.
//
#if canImport(SwiftUI)
import SwiftUI

public extension View {
    
    @ViewBuilder func onDragging(_ onDrag: @escaping (Direction) -> Void) -> some View {
        self
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged({ value in
                        if value.translation.width < 0 {
                            onDrag(.left)
                        }
                        if value.translation.width > 0 {
                            onDrag(.right)
                        }
                        if value.translation.height < 0 {
                            onDrag(.up)
                        }
                        if value.translation.height > 0 {
                            onDrag(.down)
                        }
                    })
            )
    }
}

public enum Direction {
    case left, right, up, down
}
#endif
