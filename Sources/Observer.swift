//
//  Observer.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Nikita. All rights reserved.
//

import UIKit.UIControl

typealias EnabledHandler = (Bool) -> Void
typealias ConfigurationHandler = ([String]) -> Bool

final class WeakWrapper {
    weak var value: TextableValue?
    init(value: TextableValue) {
        self.value = value
    }
}

final class NUIObserver: NSObject {
    
    private var enabledHandler: EnabledHandler
    private var textableValues: [WeakWrapper]
    private var configurationHandler: ConfigurationHandler

    // https://bugs.swift.org/browse/SR-3849
    
    init(textableValues: [TextableValue], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        self.enabledHandler = enabledHandler
        
        self.textableValues = textableValues.map { textableValue in
            return WeakWrapper(value: textableValue)
        }

        super.init()
        
        textableValues.forEach { textableValue in
            textableValue.addObserver(self, forKeyPath: textableValue.textKey, options: [.new, .initial], context: nil)
            
            switch textableValue {
            case let value as UIControl:  value.addTarget(self, action: #selector(textableValueChanged), for: .editingChanged)
            case let value as UITextView: NotificationCenter.default.addObserver(self,
                                                                                 selector: #selector(textVewChanged),
                                                                                 name: .UITextViewTextDidChange,
                                                                                 object: value)
            default: break
            }
        }
    }
    
    // MARK: Text changing events
    
    /// This method is called when the `UITextViewTextDidChange` notification of `UITextView` is triggered.
    @objc private func textVewChanged() {
        configureEnabling()
    }
    
    /// This method is called when the `editingChanged` event of `UIControl` is triggered.
    @objc private func textableValueChanged() {
        configureEnabling()
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey: Any]?,
                               context: UnsafeMutableRawPointer?) {
        configureEnabling()
    }
    
    // MARK: Helpers
    
    private func configureEnabling() {
        let texts = textableValues.flatMap { textableValue -> String? in
            guard let value = textableValue.value else {
                return nil
            }
            return value.value(forKey: value.textKey) as? String
        }
        enabledHandler(configurationHandler(texts))
    }
}
