//
//  ViewController.swift
//  NxEnabled
//
//  Created by Nikita Ermolenko on 12/01/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit
import ObjectiveC

class TextField : UITextField {
    deinit {
        print("here")
    }
}

class ViewController: UIViewController {

    var textField1 = TextField(frame: .zero)
    var textField2 = TextField(frame: .zero)

    @IBOutlet weak var button: UIButton!
    
    deinit {
        button.clearBag()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.backgroundColor = .red
        textField2.backgroundColor = .red
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        
//        button.isEnabled(by: textField1) { value1 in
//            return value1.characters.count > 5
//        }

        button.isEnabled(by: textField1, textField2) { v1, v2 -> Bool in
            return true
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textField1.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        textField2.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
    }

}

