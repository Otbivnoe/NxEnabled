//
//  Button+Observer.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Nikita. All rights reserved.
//

import UIKit.UIButton

public typealias TextableValue = NSObject & Textable

public typealias ConfigurationHandler1 = (String) -> Bool
public typealias ConfigurationHandler2 = (String, String) -> Bool
public typealias ConfigurationHandler3 = (String, String, String) -> Bool
public typealias ConfigurationHandler4 = (String, String, String, String) -> Bool
public typealias ConfigurationHandler5 = (String, String, String, String, String) -> Bool
public typealias ConfigurationHandler6 = (String, String, String, String, String, String) -> Bool

private var observerTypeAssociationKey: UInt8 = 0

extension UIButton {
    
    /// Special object which observes text for all textable values.
    
    private var observer: NUIObserver? {
        get { return objc_getAssociatedObject(self, &observerTypeAssociationKey) as? NUIObserver }
        set { objc_setAssociatedObject(self, &observerTypeAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var enabledHandler: (Bool) -> Void {
        return { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
    
    /// Clears all observers from textable values, which have been configured by `isEnabled` method.
    ///
    /// - note: Don't forget to call this method when you need to remove observers from `textableValue`s. Usually it's a `deinit` method.
    ///
    
    public func clearBag() {
        observer = nil
    }
}

// MARK: - NUIObserber1

extension UIButton {
    
    /// Setup `isEnabled` property binding with one textable value.
    ///
    /// - parameter textableValue:          Textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable value and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Don't forget about `dynamic` for your property.
    ///
    
    public func isEnabled(by textableValue: TextableValue,
                          configurationHandler: @escaping ConfigurationHandler1) {
        
        let inputs = [textableValue]
        observer = NUIObserver(textableValues: inputs, configurationHandler: { texts in
            configurationHandler(texts[0])
        }, enabledHandler: enabledHandler)
    }
}

// MARK: - NUIObserber2

extension UIButton {
    
    /// Setup `isEnabled` property binding with two textable values.
    ///
    /// - parameter textableValue1:         First textable value for binding.
    /// - parameter textableValue2:         Second textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable values and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Don't forget about `dynamic` for your property.
    ///
    
    public func isEnabled(by textableValue1: TextableValue,
                          _ textableValue2: TextableValue,
                          configurationHandler: @escaping ConfigurationHandler2) {
        
        let inputs = [textableValue1, textableValue2]
        observer = NUIObserver(textableValues: inputs, configurationHandler: { texts in
            configurationHandler(texts[0], texts[1])
        }, enabledHandler: enabledHandler)
    }
}

// MARK: - NUIObserber3

extension UIButton {
    
    /// Setup `isEnabled` property binding with three textable values.
    ///
    /// - parameter textableValue1:         First textable value for binding.
    /// - parameter textableValue2:         Second textable value for binding.
    /// - parameter textableValue3:         Third textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable values and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Don't forget about `dynamic` for your property.
    ///
    
    public func isEnabled(by textableValue1: TextableValue,
                          _ textableValue2: TextableValue,
                          _ textableValue3: TextableValue,
                          configurationHandler: @escaping ConfigurationHandler3) {
        
        let inputs = [textableValue1, textableValue2, textableValue3]
        observer = NUIObserver(textableValues: inputs, configurationHandler: { texts in
            configurationHandler(texts[0], texts[1], texts[2])
        }, enabledHandler: enabledHandler)
    }
}

// MARK: - NUIObserber4

extension UIButton {
    
    /// Setup `isEnabled` property binding with four textable values.
    ///
    /// - parameter textableValue1:         First textable value for binding.
    /// - parameter textableValue2:         Second textable value for binding.
    /// - parameter textableValue3:         Third textable value for binding.
    /// - parameter textableValue4:         Fourth textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable values and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Don't forget about `dynamic` for your property.
    ///
    
    public func isEnabled(by textableValue1: TextableValue,
                          _ textableValue2: TextableValue,
                          _ textableValue3: TextableValue,
                          _ textableValue4: TextableValue,
                          configurationHandler: @escaping ConfigurationHandler4) {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4]
        observer = NUIObserver(textableValues: inputs, configurationHandler: { texts in
            configurationHandler(texts[0], texts[1], texts[2], texts[3])
        }, enabledHandler: enabledHandler)
    }
}

// MARK: - NUIObserber5

extension UIButton {
    
    /// Setup `isEnabled` property binding with five textable values.
    ///
    /// - parameter textableValue1:         First textable value for binding.
    /// - parameter textableValue2:         Second textable value for binding.
    /// - parameter textableValue3:         Third textable value for binding.
    /// - parameter textableValue4:         Fourth textable value for binding.
    /// - parameter textableValue5:         Fifth textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable values and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Don't forget about `dynamic` for your property.
    ///
    
    public func isEnabled(by textableValue1: TextableValue,
                          _ textableValue2: TextableValue,
                          _ textableValue3: TextableValue,
                          _ textableValue4: TextableValue,
                          _ textableValue5: TextableValue,
                          configurationHandler: @escaping ConfigurationHandler5) {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4, textableValue5]
        observer = NUIObserver(textableValues: inputs, configurationHandler: { texts in
            configurationHandler(texts[0], texts[1], texts[2], texts[3], texts[4])
        }, enabledHandler: enabledHandler)
    }
}

// MARK: - NUIObserber6

extension UIButton {
    
    /// Setup `isEnabled` property binding with six textable values.
    ///
    /// - parameter textableValue1:         First textable value for binding.
    /// - parameter textableValue2:         Second textable value for binding.
    /// - parameter textableValue3:         Third textable value for binding.
    /// - parameter textableValue4:         Fourth textable value for binding.
    /// - parameter textableValue5:         Fifth textable value for binding.
    /// - parameter textableValue6:         Sixth textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable values and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Don't forget about `dynamic` for your property.
    ///
    
    public func isEnabled(by textableValue1: TextableValue,
                          _ textableValue2: TextableValue,
                          _ textableValue3: TextableValue,
                          _ textableValue4: TextableValue,
                          _ textableValue5: TextableValue,
                          _ textableValue6: TextableValue,
                          configurationHandler: @escaping ConfigurationHandler6) {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4, textableValue5, textableValue6]
        observer = NUIObserver(textableValues: inputs, configurationHandler: { texts in
            configurationHandler(texts[0], texts[1], texts[2], texts[3], texts[4], texts[5])
        }, enabledHandler: enabledHandler)
    }
}
