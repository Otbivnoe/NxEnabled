//
//  Observers.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation

typealias EnabledHandler = (Bool) -> Void

typealias ConfigurationHandler1 = (String) -> Bool
typealias ConfigurationHandler2 = (String,String) -> Bool
typealias ConfigurationHandler3 = (String,String,String) -> Bool
typealias ConfigurationHandler4 = (String,String,String,String) -> Bool
typealias ConfigurationHandler5 = (String,String,String,String,String) -> Bool
typealias ConfigurationHandler6 = (String,String,String,String,String,String) -> Bool

fileprivate struct Key {
    static let textObservableKey = "text"
}

class NUIObserver: NSObject {
    
    var enabledHandler: EnabledHandler
    var weakInputFields: NSPointerArray
    
    deinit {
        weakInputFields.allObjects.forEach { inputField in
            (inputField as! NSObject).removeObserver(self, forKeyPath: Key.textObservableKey)
        }
    }
    
    init(inputFields: [Textable], enabledHandler: @escaping EnabledHandler) {
        self.enabledHandler = enabledHandler
        self.weakInputFields = NSPointerArray(options: .weakMemory)
        
        super.init()
        
        inputFields.forEach { inputField in
            switch inputField {
            case let inputField as NSObject:
                inputField.addObserver(self, forKeyPath: Key.textObservableKey, options: [.new], context: nil)
                self.weakInputFields.addPointer(Unmanaged.passUnretained(inputField).toOpaque())
            default: fatalError("\(inputField) isn't inherited from NSObject")
            }
        }
    }
    
    func text(at index: Int) -> String {
        return (weakInputFields.allObjects[index] as! Textable).nx_text
    }
}

final class NUIObserver1: NUIObserver {
    
    typealias ConfigurationHandler = ConfigurationHandler1
    private var configurationHandler: ConfigurationHandler
    
    init(inputFields: [Textable], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        super.init(inputFields: inputFields, enabledHandler: enabledHandler)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let text = self.text(at: 0)
        enabledHandler(configurationHandler(text))
    }
}

final class NUIObserver2: NUIObserver {
    
    typealias ConfigurationHandler = ConfigurationHandler2
    private var configurationHandler: ConfigurationHandler
    
    init(inputFields: [Textable], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        super.init(inputFields: inputFields, enabledHandler: enabledHandler)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let text0 = self.text(at: 0)
        let text1 = self.text(at: 1)
        enabledHandler(configurationHandler("", ""))
    }
}

final class NUIObserver3: NUIObserver {
    
    typealias ConfigurationHandler = ConfigurationHandler3
    private var configurationHandler: ConfigurationHandler
    
    init(inputFields: [Textable], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        super.init(inputFields: inputFields, enabledHandler: enabledHandler)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let text0 = self.text(at: 0)
        let text1 = self.text(at: 1)
        let text2 = self.text(at: 2)
        enabledHandler(configurationHandler(text0, text1, text2))
    }
}

final class NUIObserver4: NUIObserver {
    
    typealias ConfigurationHandler = ConfigurationHandler4
    private var configurationHandler: ConfigurationHandler
    
    init(inputFields: [Textable], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        super.init(inputFields: inputFields, enabledHandler: enabledHandler)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let text0 = self.text(at: 0)
        let text1 = self.text(at: 1)
        let text2 = self.text(at: 2)
        let text3 = self.text(at: 3)
        enabledHandler(configurationHandler(text0, text1, text2, text3))
    }
}

final class NUIObserver5: NUIObserver {
    
    typealias ConfigurationHandler = ConfigurationHandler5
    private var configurationHandler: ConfigurationHandler
    
    init(inputFields: [Textable], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        super.init(inputFields: inputFields, enabledHandler: enabledHandler)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let text0 = self.text(at: 0)
        let text1 = self.text(at: 1)
        let text2 = self.text(at: 2)
        let text3 = self.text(at: 3)
        let text4 = self.text(at: 4)
        enabledHandler(configurationHandler(text0, text1, text2, text3, text4))
    }
}

final class NUIObserver6: NUIObserver {
    
    typealias ConfigurationHandler = ConfigurationHandler6
    private var configurationHandler: ConfigurationHandler
    
    init(inputFields: [Textable], configurationHandler: @escaping ConfigurationHandler, enabledHandler: @escaping EnabledHandler) {
        self.configurationHandler = configurationHandler
        super.init(inputFields: inputFields, enabledHandler: enabledHandler)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let text0 = self.text(at: 0)
        let text1 = self.text(at: 1)
        let text2 = self.text(at: 2)
        let text3 = self.text(at: 3)
        let text4 = self.text(at: 4)
        let text5 = self.text(at: 5)
        enabledHandler(configurationHandler(text0, text1, text2, text3, text4, text5))
    }
}
