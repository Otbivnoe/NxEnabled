//
//  JustReturnedEnabledValueTests.swift
//  JustReturnedEnabledValueTests
//
//  Created by Nikita Ermolenko on 08/02/2017.
//
//

import XCTest
import NxEnabled

final class JustReturnedEnabledValueTests: BaseTests {

    let newEnabledValue = true
    
    override func setUp() {
        super.setUp()
        button.isEnabled = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatConfiguresCorrectEnabledValueForOneTextableElement() {
        button.isEnabled(by: textfield1) { [unowned self] _ in
            return self.newEnabledValue
        }
        
        XCTAssertEqual(button.isEnabled, newEnabledValue)
    }
    
    func testThatConfiguresCorrectEnabledValueForTwoTextableElements() {
        button.isEnabled(by: textfield1, textfield2) { [unowned self] _, _ in
            return self.newEnabledValue
        }
        
        XCTAssertEqual(button.isEnabled, newEnabledValue)
    }
    
    func testThatConfiguresCorrectEnabledValueForThreeTextableElements() {
        button.isEnabled(by: textfield1, textfield2, textfield3) { [unowned self] _, _, _ in
            return self.newEnabledValue
        }
        
        XCTAssertEqual(button.isEnabled, newEnabledValue)
    }
    
    func testThatConfiguresCorrectEnabledValueForFourTextableElements() {
        button.isEnabled(by: textfield1, textfield2, textfield3, textfield4) { [unowned self]  _, _, _, _ in
            return self.newEnabledValue
        }
        
        XCTAssertEqual(button.isEnabled, newEnabledValue)
    }
    
    func testThatConfiguresCorrectEnabledValueForFiveTextableElements() {
        button.isEnabled(by: textfield1, textfield2, textfield3, textfield4, textfield5) { [unowned self] _, _, _, _, _ in
            return self.newEnabledValue
        }
        
        XCTAssertEqual(button.isEnabled, newEnabledValue)
    }
    
    func testThatConfiguresCorrectEnabledValueForSixTextableElements() {
        button.isEnabled(by: textfield1, textfield2, textfield3, textfield4, textfield5, textfield6) { [unowned self] _, _, _, _, _, _ in
            return self.newEnabledValue
        }
        
        XCTAssertEqual(button.isEnabled, newEnabledValue)
    }
}
