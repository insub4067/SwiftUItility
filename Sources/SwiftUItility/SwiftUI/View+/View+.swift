//
//  File.swift
//  
//
//  Created by 김인섭 on 12/14/23.
//

import SwiftUI

public extension View {
    
    @ViewBuilder func show(_ state: Bool) -> some View {
        if state {
            self
        }
    }
    
    @ViewBuilder func hide(_ state: Bool) -> some View {
        if !state {
            self
        }
    }
    
    @ViewBuilder func roundedBorder(
        _ color: Color = .gray.opacity(0.6),
        radius: CGFloat = 8,
        linewidth: CGFloat = 1
    ) -> some View {
        self.overlay {
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: linewidth)
        }
    }
    
    @ViewBuilder func underline(
        _ color: Color = .gray.opacity(0.6),
        lineheight: CGFloat = 1
    ) -> some View {
        self
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: lineheight)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(color)
            }
    }
}
