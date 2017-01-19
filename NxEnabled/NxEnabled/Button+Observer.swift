//
//  Button+Observer.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Nikita. All rights reserved.
//

import UIKit.UIButton

private var observerTypeAssociationKey: UInt8 = 0

extension UIButton {
    
    /// Special object which observes text for all textable values
    
    fileprivate var observer: NUIObserver? {
        get { return objc_getAssociatedObject(self, &observerTypeAssociationKey) as! NUIObserver? }
        set { objc_setAssociatedObject(self, &observerTypeAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    /// Clears all observers from textable values, wich have been configured by `isEnabled` method.
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
    ///         Dont forget about `dynamic` for your property.
    ///
    
    public func isEnabled<T: NSObject>(by textableValue: T,
                                        configurationHandler: @escaping ConfigurationHandler1) where T: Textable {

        observer = NUIObserver1(textableValues: [textableValue], configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
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
    ///         Dont forget about `dynamic` for your property.
    ///
    
    public func isEnabled<T1: NSObject, T2: NSObject>(by textableValue1: T1,
                                                        _ textableValue2: T2,
                                                        configurationHandler: @escaping ConfigurationHandler2)
        where T1: Textable, T2: Textable {
        
        let inputs = [textableValue1, textableValue2]
        observer = NUIObserver2(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
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
    ///         Dont forget about `dynamic` for your property.
    ///
    
    public func isEnabled<T1: NSObject, T2: NSObject, T3: NSObject>(by textableValue1: T1,
                                                                    _ textableValue2: T2,
                                                                    _ textableValue3: T3,
                                                                    configurationHandler: @escaping ConfigurationHandler3)
        where T1: Textable, T2: Textable, T3: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3]
        observer = NUIObserver3(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
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
    ///         Dont forget about `dynamic` for your property.
    ///
    
    public func isEnabled<T1: NSObject, T2: NSObject, T3: NSObject, T4: NSObject>(by textableValue1: T1,
                                                                                    _ textableValue2: T2,
                                                                                    _ textableValue3: T3,
                                                                                    _ textableValue4: T4,
                                                                                    configurationHandler: @escaping ConfigurationHandler4)
        where T1: Textable, T2: Textable, T3: Textable, T4: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4]
        observer = NUIObserver4(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
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
    ///         Dont forget about `dynamic` for your property.
    ///
    
    public func isEnabled<T1: NSObject, T2: NSObject, T3: NSObject, T4: NSObject, T5: NSObject>(by textableValue1: T1,
                                                                                                _ textableValue2: T2,
                                                                                                _ textableValue3: T3,
                                                                                                _ textableValue4: T4,
                                                                                                _ textableValue5: T5,
                                                                                                configurationHandler: @escaping ConfigurationHandler5)
        where T1: Textable, T2: Textable, T3: Textable, T4: Textable, T5: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4, textableValue5]
        observer = NUIObserver5(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
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
    /// - parameter textableValue5:         Sixth textable value for binding.
    /// - parameter configurationHandler:   Configuration handler within which you should configure `isEnabled` state by current textable values and return it.
    ///
    /// - note: You can pass not only UI elements such as `UITextView` and `UITextField`, for example.
    ///         But also any object which conforms to `Textable` protocol and is the successor of `NSObject`.
    ///         Dont forget about `dynamic` for your property.
    ///
    
    public func isEnabled<T1: NSObject, T2: NSObject, T3: NSObject, T4: NSObject, T5: NSObject, T6: NSObject>(by textableValue1: T1,
                                                                                                                _ textableValue2: T2,
                                                                                                                _ textableValue3: T3,
                                                                                                                _ textableValue4: T4,
                                                                                                                _ textableValue5: T5,
                                                                                                                _ textableValue6: T6,
                                                                                                                configurationHandler: @escaping ConfigurationHandler6)
        where T1: Textable, T2: Textable, T3: Textable, T4: Textable, T5: Textable, T6: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4, textableValue5, textableValue6]
        observer = NUIObserver6(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}
