//
//  alert.swift
//
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(SwiftUI)
import SwiftUI

public class AlertController {
    
    public func show(_ parameter: AlertParameter) {
        let alert = UIAlertController(
            title: parameter.title,
            message: parameter.message,
            preferredStyle: .alert
        )
        parameter.buttons.forEach { button in
            let action = UIAlertAction(
                title: button.title,
                style: button.style,
                handler: { _ in button.action?() }
            )
            alert.addAction(action)
        }
        UIApplication.shared.root?.present(alert, animated: true)
    }
}

public struct AlertKey: EnvironmentKey {
    public static let defaultValue = AlertController()
}

public extension EnvironmentValues {
    var alert: AlertController {
        self[AlertKey.self]
    }
}

public struct AlertParameter {
    
    let title: String?
    let message: String
    let buttons: [ActionButton]
    
    public init(
        title: String? = .none,
        message: String,
        buttons: [ActionButton]
    ) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}

public struct ActionButton {
    
    let title: String
    let style: UIAlertAction.Style
    let action: (() -> Void)?
    
    public init(
        title: String,
        style: UIAlertAction.Style = .default,
        action: (() -> Void)? = .none
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}
#endif
