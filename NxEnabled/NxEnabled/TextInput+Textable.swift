//
//  TextInput+Textable.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Nikita. All rights reserved.
//

import UIKit.UITextField
import UIKit.UITextView

/// Protocol which allow you binding `isEnabled` property of the button with object conforming it.
public protocol Textable {
    var textKey: String { get }
}

extension UITextField: Textable {
     public var textKey: String {
        return "text"
    }
}

extension UITextView: Textable {
    public var textKey: String {
        return "text"
    }
}
