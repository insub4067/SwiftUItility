//
//  View+bind.swift
//
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(SwiftUI)
import SwiftUI

public extension View {
    
    func sync<T: Equatable>(_ binding: Binding<T>, with focusState: FocusState<T>.Binding) -> some View {
        self
            .onChange(of: binding.wrappedValue) {
                focusState.wrappedValue = $0
            }
            .onChange(of: focusState.wrappedValue) {
                binding.wrappedValue = $0
            }
    }
}
#endif
