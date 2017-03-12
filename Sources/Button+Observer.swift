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
        set { objc_setAssociatedObject(self, &observerTypeAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
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
    
    public func isEnabled<T: Textable>(by textableValues: [T],
                          configurationHandler: @escaping ConfigurationHandler) {
        observer = NUIConfigurableObserver(textableValues: textableValues,
                                           configurationHandler: configurationHandler,
                                           enabledHandler: { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        })
    }
}

