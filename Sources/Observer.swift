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

final class NUIObserver: NSObject {
    
    private var enabledHandler: EnabledHandler
    private var textableValues: NSPointerArray /// Weak array of textable values.
    private var configurationHandler: ConfigurationHandler

    deinit {
        textableValues.allObjects.map { textableValueTuple(by: $0) }.forEach { (value, key) in
            value.removeObserver(self, forKeyPath: key)
        }
    }
    
    init(textableValues: [NSObject], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        self.enabledHandler = enabledHandler
        self.textableValues = NSPointerArray(options: .weakMemory)
        
        super.init()
        
        textableValues.forEach { value in
            self.textableValues.addPointer(Unmanaged.passUnretained(value).toOpaque())
        }

        let textableValueTuples = textableValues.map {
            textableValueTuple(by: $0)
        }
        textableValueTuples.forEach { (value, key) in
            value.addObserver(self, forKeyPath: key, options: [.new, .initial], context: nil)

            switch value {
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
        let texts = textableValues.allObjects.map { textableValue -> String in
            let object = textableValue as! NSObject
            let key = (object as! Textable).textKey
            return object.value(forKey: key) as? String ?? ""
        }
        enabledHandler(configurationHandler(texts))
    }

    private func textableValueTuple(by value: Any) -> (value: NSObject, key: String) {
        let textableValue = value as! NSObject
        let key = (textableValue as! Textable).textKey
        return (textableValue, key)
    }
}
