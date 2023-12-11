//
//  View+safeAreaInsets.swift
//
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(SwiftUI)
import SwiftUI

public struct SafeAreaInsetsKey: EnvironmentKey {
    
    public static var defaultValue: EdgeInsets {
        
        let safeAreaInsets = UIApplication
            .shared
            .window?
            .safeAreaInsets
        
        guard let safeAreaInsets else { return .init() }

        return .init(
            top: safeAreaInsets.top,
            leading: safeAreaInsets.left,
            bottom: safeAreaInsets.bottom,
            trailing: safeAreaInsets.right
        )
    }
}

public extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

public extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        .init(
            top: top,
            leading: left,
            bottom: bottom,
            trailing: right
        )
    }
}
#endif
