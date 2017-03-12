//
//  Observers.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Nikita. All rights reserved.
//

import UIKit.UIControl

typealias EnabledHandler = (Bool) -> Void

public typealias ConfigurationHandler = ([String]) -> Bool


// MARK: - NUIObserver

class NUIObserver: NSObject {
    
    fileprivate var enabledHandler: EnabledHandler
    fileprivate var textableValues: NSPointerArray /// Weak array of textable values.

    deinit {
        textableValues.allObjects.map { textableValueTuple(by: $0) }.forEach { (value, key) in
            value.removeObserver(self, forKeyPath: key)
        }
    }
    
    //TODO: Refactore later, when apple fix it https://bugs.swift.org/browse/SR-3849
    
    init(textableValues: [NSObjectProtocol], enabledHandler: @escaping EnabledHandler) {
        self.enabledHandler = enabledHandler
        self.textableValues = NSPointerArray(options: .weakMemory)
        
        super.init()
        
        textableValues.forEach { value in
            self.textableValues.addPointer(Unmanaged.passUnretained(value).toOpaque())
        }

        let textableValueTuples = textableValues.map { textableValueTuple(by: $0) }
        textableValueTuples.forEach { (value, key) in
            value.addObserver(self, forKeyPath: key, options: [.new, .initial], context: nil)

            switch value {
            case let value as UIControl:  value.addTarget(self, action:#selector(textableValueChanged), for: .editingChanged)
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
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        configureEnabling()
    }
    
    // MARK: Helpers
    
    fileprivate func configureEnabling() {
        preconditionFailure("This method must be overridden")
    }
        
    private func textableValueTuple(by value: Any) -> (value:NSObject, key:String) {
        let textableValue = value as! NSObject
        let key = (textableValue as! Textable).textKey
        return (textableValue, key)
    }
}

// MARK: - NUIConfigurableObserver

final class NUIConfigurableObserver: NUIObserver {
    
    private var configurationHandler: ConfigurationHandler
    
    init(textableValues: [NSObjectProtocol],
         configurationHandler: @escaping ConfigurationHandler,
         enabledHandler: @escaping EnabledHandler) {
        
        self.configurationHandler = configurationHandler
        super.init(textableValues: textableValues, enabledHandler: enabledHandler)
    }

    fileprivate override func configureEnabling() {
        let texts = self.textableValues.allObjects.map { (t) -> String in
            let textableValue = t as! Textable
            let objectValue = t as! NSObject
            return objectValue.value(forKey: textableValue.textKey) as? String ?? ""
        }
        enabledHandler(configurationHandler(texts))
    }
}
