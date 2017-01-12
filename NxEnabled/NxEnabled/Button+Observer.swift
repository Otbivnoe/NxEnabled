//
//  Button+Observer.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

fileprivate var observerTypeAssociationKey: UInt8 = 0

#if os(iOS)
    extension UIButton {
        
        var observer: NUIObserver {
            get {
                return objc_getAssociatedObject(self, &observerTypeAssociationKey) as! NUIObserver
            }
            set {
                objc_setAssociatedObject(self, &observerTypeAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
        
        func isEnabled(by textField: Textable, configurationHandler: @escaping ConfigurationHandler1) {
            observer = NUIObserver1(inputFields: [textField], configurationHandler: configurationHandler) { [unowned self] isEnabled in
                self.isEnabled = isEnabled
            }
        }
        
        func isEnabled(by textField1: Textable, _ textField2: Textable, configurationHandler: @escaping ConfigurationHandler2) {
            observer = NUIObserver2(inputFields: [textField1, textField2], configurationHandler: configurationHandler) { [unowned self] isEnabled in
                self.isEnabled = isEnabled
            }
        }
        
        func isEnabled(by textField1: Textable, _ textField2: Textable, _ textField3: Textable, configurationHandler: @escaping ConfigurationHandler3) {
            observer = NUIObserver3(inputFields: [textField1, textField2, textField3], configurationHandler: configurationHandler) { [unowned self] isEnabled in
                self.isEnabled = isEnabled
            }
        }
        
        func isEnabled(by textField1: Textable, _ textField2: Textable, _ textField3: Textable, _ textField4: Textable, configurationHandler: @escaping ConfigurationHandler4) {
            observer = NUIObserver4(inputFields: [textField1, textField2, textField3, textField4], configurationHandler: configurationHandler) { [unowned self] isEnabled in
                self.isEnabled = isEnabled
            }
        }
        
        func isEnabled(by textField1: Textable, _ textField2: Textable, _ textField3: Textable, _ textField4: Textable, _ textField5: Textable, configurationHandler: @escaping ConfigurationHandler5)
        {
            observer = NUIObserver5(inputFields: [textField1, textField2, textField3, textField4, textField5], configurationHandler: configurationHandler) { [unowned self] isEnabled in
                self.isEnabled = isEnabled
            }
        }
        
        func isEnabled(by textField1: Textable, _ textField2: Textable, _ textField3: Textable, _ textField4: Textable, _ textField5: Textable, _ textField6: Textable, configurationHandler: @escaping ConfigurationHandler6) {
            observer = NUIObserver6(inputFields: [textField1, textField2, textField3, textField4, textField5, textField6], configurationHandler: configurationHandler) { [unowned self] isEnabled in
                self.isEnabled = isEnabled
            }
        }
    }
#elseif os(OSX)
    
    //TODO: NSButton
    
#endif
