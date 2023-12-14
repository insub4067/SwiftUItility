//
//  UIApplication+.swift
//
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(UIKit)
import UIKit

public extension UIApplication {
    
    var scene: UIWindowScene? {
        UIApplication
            .shared
            .connectedScenes
            .first as? UIWindowScene
    }
    
    var window: UIWindow? {
        scene?
            .windows
            .first(where: { $0.isKeyWindow })
    }
    
    var root: UIViewController? {
        window?.rootViewController
    }
    
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
#endif
