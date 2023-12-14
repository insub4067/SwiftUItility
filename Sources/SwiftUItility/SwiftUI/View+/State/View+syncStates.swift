//
//  File.swift
//  
//
//  Created by 김인섭 on 12/13/23.
//

import SwiftUI

public extension View {
    
    @ViewBuilder func syncStates<T: Equatable>(
        _ state: Binding<T>,
        and anotherState: Binding<T>,
        animated: Bool = false
    ) -> some View {
        self
            .onChange(of: state.wrappedValue) {
                switch animated {
                case true:
                    withAnimation {
                        anotherState.wrappedValue = state.wrappedValue
                    }
                case false:
                    anotherState.wrappedValue = $0
                }
            }
            .onChange(of: anotherState.wrappedValue) {
                switch animated {
                case true:
                    withAnimation {
                        state.wrappedValue = anotherState.wrappedValue
                    }
                case false:
                    state.wrappedValue = $0
                }
            }
    }
}
