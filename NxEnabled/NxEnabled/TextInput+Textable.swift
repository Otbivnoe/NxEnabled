//
//  TextInput+Textable.swift
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

protocol Textable {
    var textKey: String { get }
}

#if os(iOS)
    extension UITextField: Textable {
        var textKey: String {
            return "text"
        }
    }
    
    extension UITextView: Textable {
        var textKey: String {
            return "text"
        }
    }
#elseif os(OSX)
    extension NSTextField: Textable {
        var textKey: String {
            return "stringValue"
        }
    }
    
    extension NSTextView: Textable {
        var textKey: String {
            return "string"
        }
    }
#endif
