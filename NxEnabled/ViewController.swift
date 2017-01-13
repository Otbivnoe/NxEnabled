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

    var textField1: TextField? = TextField()
    var textField2:TextField? = TextField()

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(textField1)
//        view.addSubview(textField2)
        
        button.isEnabled(by: textField1!, textField2!) { value1, value2 in
            return value1.characters.count > 5
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            self.textField1 = nil
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        textField1!.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        textField2!.frame = CGRect(x: 50, y: 300, width: 100, height: 50)
    }

}

