//
//  File.swift
//  
//
//  Created by 김인섭 on 12/11/23.
//
#if canImport(SwiftUI)
import SwiftUI

public class SpinnerController {
    
    private var acitivity: UIActivityIndicatorView?
    
    public func start(_ style: UIActivityIndicatorView.Style = .medium) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let root = UIApplication.shared.root
            if self.acitivity == nil {
                let indicator = UIActivityIndicatorView()
                indicator.style = .medium
                indicator.hidesWhenStopped = true
                indicator.frame = .init(
                    x: 0, y: 0, width: 50, height: 50
                )
                self.acitivity = indicator
                root?.view.addSubview(indicator)
                indicator.center = root?.view.center ?? .init()
            }
            acitivity?.startAnimating()
        }
    }
    
    public func stop() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.acitivity?.stopAnimating()
        }
    }
}

public struct SpinnerKey: EnvironmentKey {
    public static let defaultValue: SpinnerController = SpinnerController()
}

public extension EnvironmentValues {
    var spinner: SpinnerController {
        self[SpinnerKey.self]
    }
}
#endif
