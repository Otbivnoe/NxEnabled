//
//  KeyboardEventTests.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 08/02/2017.
//
//

import XCTest
import NxEnabled

final class KeyboardEventTests: BaseTests {

    var triggeredEventCount = 0
    var needHandle = false
    
    override func setUp() {
        super.setUp()

        triggeredEventCount = 0
        needHandle = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForOneTextableElement_Textfield() {
        button.isEnabled(by: textfield1) { [unowned self] _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }

        needHandle = true
        textfield1.sendActions(for: .editingChanged)
        XCTAssertEqual(triggeredEventCount, 1)
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForOneTextableElement_Textview() {
        button.isEnabled(by: textview1) { [unowned self] _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }
        
        needHandle = true
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview1)
        XCTAssertEqual(triggeredEventCount, 1)
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForTwoTextableElements() {
        button.isEnabled(by: textfield1, textview1) { [unowned self] _, _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }
        
        needHandle = true
        textfield1.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview1)
        XCTAssertEqual(triggeredEventCount, 2)
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForThreeTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2) { [unowned self] _, _, _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }
        
        needHandle = true
        textfield1.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview1)
        textfield2.sendActions(for: .editingChanged)
        XCTAssertEqual(triggeredEventCount, 3)
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForFourTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2, textview2) { [unowned self] _, _, _, _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }
        
        needHandle = true
        textfield1.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview1)
        textfield2.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview2)
        XCTAssertEqual(triggeredEventCount, 4)
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForFiveTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2, textview2, textfield3) { [unowned self] _, _, _, _, _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }
        
        needHandle = true
        textfield1.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview1)
        textfield2.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview2)
        textfield3.sendActions(for: .editingChanged)
        XCTAssertEqual(triggeredEventCount, 5)
    }
    
    func testThatCorrectlyHandlesKeyboardTypingEventForSixTextableElements() {
        button.isEnabled(by: textfield1, textview1, textfield2, textview2, textfield3, textview3) { [unowned self] _, _, _, _, _, _ in
            if self.needHandle {
                self.triggeredEventCount += 1
            }
            return true
        }
        
        needHandle = true
        textfield1.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview1)
        textfield2.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview2)
        textfield3.sendActions(for: .editingChanged)
        NotificationCenter.default.post(name: .UITextViewTextDidChange, object: textview3)
        XCTAssertEqual(triggeredEventCount, 6)
    }
}

