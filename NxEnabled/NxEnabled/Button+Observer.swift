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
    
    fileprivate var observer: NUIObserver? {
        get { return objc_getAssociatedObject(self, &observerTypeAssociationKey) as! NUIObserver? }
        set { objc_setAssociatedObject(self, &observerTypeAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    public func clearBag() {
        observer = nil
    }
}

// MARK: - NUIObserber1

extension UIButton {
    public func isEnabled<T: NSObject>(by textableValue: T,
                                        configurationHandler: @escaping ConfigurationHandler1) where T: Textable {

        observer = NUIObserver1(textableValues: [textableValue], configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}

// MARK: - NUIObserber2

extension UIButton {
    public func isEnabled<T: NSObject>(by textableValue1: T,
                                        _ textableValue2: T,
                                        configurationHandler: @escaping ConfigurationHandler2) where T: Textable {
        
        let inputs = [textableValue1, textableValue2]
        observer = NUIObserver2(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}

// MARK: - NUIObserber3

extension UIButton {
    public func isEnabled<T: NSObject>(by textableValue1: T,
                                        _ textableValue2: T,
                                        _ textableValue3: T,
                                        configurationHandler: @escaping ConfigurationHandler3) where T: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3]
        observer = NUIObserver3(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}

// MARK: - NUIObserber4

extension UIButton {
    public func isEnabled<T: NSObject>(by textableValue1: T,
                                        _ textableValue2: T,
                                        _ textableValue3: T,
                                        _ textableValue4: T,
                                        configurationHandler: @escaping ConfigurationHandler4) where T: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4]
        observer = NUIObserver4(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}

// MARK: - NUIObserber5

extension UIButton {
    public func isEnabled<T: NSObject>(by textableValue1: T,
                                        _ textableValue2: T,
                                        _ textableValue3: T,
                                        _ textableValue4: T,
                                        _ textableValue5: T,
                                        configurationHandler: @escaping ConfigurationHandler5) where T: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4, textableValue5]
        observer = NUIObserver5(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}

// MARK: - NUIObserber6

extension UIButton {
    public func isEnabled<T: NSObject>(by textableValue1: T,
                                        _ textableValue2: T,
                                        _ textableValue3: T,
                                        _ textableValue4: T,
                                        _ textableValue5: T,
                                        _ textableValue6: T,
                                        configurationHandler: @escaping ConfigurationHandler6) where T: Textable {
        
        let inputs = [textableValue1, textableValue2, textableValue3, textableValue4, textableValue5, textableValue6]
        observer = NUIObserver6(textableValues: inputs, configurationHandler: configurationHandler) { [unowned self] isEnabled in
            self.isEnabled = isEnabled
        }
    }
}
