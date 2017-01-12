//
//  ViewController.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        button.isEnabled(by: textField1, textField1) { value1, value2 in
            return value1.characters.count > 5
        }
        
        textField1.text = "text"
    }

}

