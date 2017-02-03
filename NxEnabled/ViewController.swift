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

class Object: NSObject, Textable {
    dynamic var text: String?
    
    var textKey: String {
        return "text"
    }
}



class ViewController: UIViewController {

    var obj = Object()
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var textVIew1: UITextView!
    
    deinit {
        button.clearBag()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.textview.text = "TextView"
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                self.textField1.text = "textField1"
//            }
            
            self.obj.text = "TEXT"
        }
        
        
        button.isEnabled(by: textview, textVIew1) { v1, v2 in
            print("\(v1) + \(v2)")
            return v1.characters.count > 3 && v2.characters.count > 3
        }
    }
}

