//
//  ViewController.swift
//  NxEnabledExample
//
//  Created by Nikita Ermolenko on 03/10/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit
import NxEnabled

class ViewController: UIViewController {

    @IBOutlet weak var testTextField: UITextField!
    @IBOutlet weak var testTextView: UITextView!    
    @IBOutlet weak var testButton: UIButton!

    deinit {
        testButton.clearBag()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.isEnabled(by: testTextField, testTextView) { (value1, value2) -> Bool in
            return value1.count > 5 && value2.count > 5
        }
    }
}
