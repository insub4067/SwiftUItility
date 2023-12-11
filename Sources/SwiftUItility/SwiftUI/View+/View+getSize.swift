//
//  File.swift
//  
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(SwiftUI)
import SwiftUI

public extension View {
    
    @ViewBuilder func getSize(_ size: @escaping (CGSize) -> Void) -> some View {
        self
            .background(
                    GeometryReader { geometry in
                        Color.clear
                            .onAppear {
                                size(geometry.size)
                            }
                    }
                )
    }
}
#endif
