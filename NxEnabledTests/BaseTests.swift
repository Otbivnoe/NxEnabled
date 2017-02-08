//
//  BaseTests.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 08/02/2017.
//
//

import XCTest

class BaseTests: XCTestCase {

    var button: UIButton!
    
    var textfield1: UITextField!
    var textfield2: UITextField!
    var textfield3: UITextField!
    var textfield4: UITextField!
    var textfield5: UITextField!
    var textfield6: UITextField!
    
    var textview1: UITextView!
    var textview2: UITextView!
    var textview3: UITextView!

    var value1: String?
    var value2: String?
    var value3: String?
    var value4: String?
    var value5: String?
    var value6: String?
    
    override func setUp() {
        super.setUp()
        
        button = UIButton()
        
        textfield1 = UITextField()
        textfield2 = UITextField()
        textfield3 = UITextField()
        textfield4 = UITextField()
        textfield5 = UITextField()
        textfield6 = UITextField()
        
        textview1 = UITextView()
        textview2 = UITextView()
        textview3 = UITextView()

        textfield1.text = "1"
        textfield2.text = "2"
        textfield3.text = "3"
        textfield4.text = "4"
        textfield5.text = "5"
        textfield6.text = "6"
        
        textview1.text = "_1"
        textview2.text = "_2"
        textview3.text = "_3"

        value1 = nil
        value2 = nil
        value3 = nil
        value4 = nil
        value5 = nil
        value6 = nil
    }
    
    override func tearDown() {
        button.clearBag()
        super.tearDown()
    }
}
