//
//  File.swift
//  
//
//  Created by 김인섭 on 12/12/23.
//
#if canImport(SwiftUI)
import SwiftUI

public struct ScreenSizeKey: EnvironmentKey {
    
    public static var defaultValue: CGSize {
        
        let size = UIApplication
            .shared
            .root?
            .view
            .frame
            .size
        
        return size ?? .zero
    }
}

public extension EnvironmentValues {
    
    var screenSize: CGSize {
        self[ScreenSizeKey.self]
    }
}
#endif
