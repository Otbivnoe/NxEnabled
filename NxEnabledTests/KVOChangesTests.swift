//
//  KVOChangesTests.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 08/02/2017.
//
//

import XCTest
import NxEnabled

final class KVOChangesTests: BaseTests {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatCorrectlyHandlesKVOChangesForOneTextableElement_Textfield() {
        button.isEnabled(by: textfield1) { [unowned self] v1 in
            self.value1 = v1
            return true
        }
        
        XCTAssertEqual(value1, textfield1.text)
        textfield1.text = "$1"
        XCTAssertEqual(value1, textfield1.text)
    }

    func testThatCorrectlyHandlesKVOChangesForOneTextableElement_Textview() {
        button.isEnabled(by: textview1) { [unowned self] v1 in
            self.value1 = v1
            return true
        }
        
        XCTAssertEqual(value1, textview1.text)
        textview1.text = "$1"
        XCTAssertEqual(value1, textview1.text)
    }
    
    func testThatCorrectlyHandlesKVOChangesForTwoTextableElements() {
        button.isEnabled(by: textfield1, textview1) { [unowned self] v1, v2 in
            self.value1 = v1
            self.value2 = v2
            return true
        }
        
        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        
        textfield1.text = "$1"
        textview1.text = "%1"

        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
    }
    
    func testThatCorrectlyHandlesKVOChangesForThreeTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2) { [unowned self] v1, v2, v3 in
            self.value1 = v1
            self.value2 = v2
            self.value3 = v3
            return true
        }

        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        
        textfield1.text = "$1"
        textview1.text = "%1"
        textfield2.text = "$2"

        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
    }
    
    func testThatCorrectlyHandlesKVOChangesForFourTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2, textview2) { [unowned self] v1, v2, v3, v4 in
            self.value1 = v1
            self.value2 = v2
            self.value3 = v3
            self.value4 = v4
            return true
        }
        
        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        XCTAssertEqual(value4, textview2.text)
        
        textfield1.text = "$1"
        textview1.text = "%1"
        textfield2.text = "$2"
        textview2.text = "%2"

        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        XCTAssertEqual(value4, textview2.text)
    }
    
    func testThatCorrectlyHandlesKVOChangesForFiveTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2, textview2, textfield3) { [unowned self] v1, v2, v3, v4, v5 in
            self.value1 = v1
            self.value2 = v2
            self.value3 = v3
            self.value4 = v4
            self.value5 = v5
            return true
        }
        
        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        XCTAssertEqual(value4, textview2.text)
        XCTAssertEqual(value5, textfield3.text)
        
        textfield1.text = "$1"
        textview1.text = "%1"
        textfield2.text = "$2"
        textview2.text = "%2"
        textfield3.text = "$3"

        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        XCTAssertEqual(value4, textview2.text)
        XCTAssertEqual(value5, textfield3.text)
    }
    
    func testThatCorrectlyHandlesKVOChangesForSixTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2, textview2, textfield3, textview3) { [unowned self] v1, v2, v3, v4, v5, v6 in
            self.value1 = v1
            self.value2 = v2
            self.value3 = v3
            self.value4 = v4
            self.value5 = v5
            self.value6 = v6
            return true
        }
        
        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        XCTAssertEqual(value4, textview2.text)
        XCTAssertEqual(value5, textfield3.text)
        XCTAssertEqual(value6, textview3.text)
        
        textfield1.text = "$1"
        textview1.text = "%1"
        textfield2.text = "$2"
        textview2.text = "%2"
        textfield3.text = "$3"
        textview3.text = "%3"
        
        XCTAssertEqual(value1, textfield1.text)
        XCTAssertEqual(value2, textview1.text)
        XCTAssertEqual(value3, textfield2.text)
        XCTAssertEqual(value4, textview2.text)
        XCTAssertEqual(value5, textfield3.text)
        XCTAssertEqual(value6, textview3.text)
    }
}
