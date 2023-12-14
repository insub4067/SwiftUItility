//
//  File.swift
//  
//
//  Created by 김인섭 on 12/14/23.
//

import SwiftUI

public extension View {
    
    @ViewBuilder func hideKeyboardOnTapBackground() -> some View {
        self
            .background(
                Color(UIColor.systemBackground)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
            )
    }
}
