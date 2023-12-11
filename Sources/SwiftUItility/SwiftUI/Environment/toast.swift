//
//  File.swift
//  
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(SwiftUI)
import SwiftUI
public class ToastController {
    
    public func show(_ message: String) {
        
        let toastTag = 111
        
        guard let view = UIApplication.shared.root?.view,
              view.viewWithTag(toastTag) == nil
        else { return }
        
        let frame = CGRect(
            x: 16,
            y: view.frame.height,
            width: (view.frame.width) - (16 * 2),
            height: 60
        )
        
        let label = UILabel(frame: frame)
        label.text = message
        label.font = .boldSystemFont(ofSize: 24)
        label.backgroundColor = .darkGray.withAlphaComponent(0.8)
        label.textAlignment = .center
        label.alpha = 0
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
        label.textColor = .white.withAlphaComponent(0.9)
        label.tag = toastTag
        
        view.addSubview(label)
        
        UIView.animate(withDuration: 0.2) {
            label.center.y = view.frame.height - 90
            label.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.2) {
                label.center.y = view.frame.height
                label.alpha = 0
            } completion: { _ in
                label.removeFromSuperview()
            }
        }
    }
}

public struct ToastKey: EnvironmentKey {
    public static let defaultValue = ToastController()
}

public extension EnvironmentValues {
    var toast: ToastController {
        self[ToastKey.self]
    }
}
#endif
