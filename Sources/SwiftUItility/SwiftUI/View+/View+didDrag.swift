//
//  File.swift
//  
//
//  Created by 김인섭 on 12/12/23.
//
#if canImport(SwiftUI)
import SwiftUI

public extension View {
    
    @ViewBuilder func didDrag(_ didDrag: @escaping (Direction) -> Void) -> some View {
        self
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.width < 0 {
                            didDrag(.left)
                        }
                        if value.translation.width > 0 {
                            didDrag(.right)
                        }
                        if value.translation.height < 0 {
                            didDrag(.up)
                        }
                        if value.translation.height > 0 {
                            didDrag(.down)
                        }
                    })
            )
    }
}
#endif
