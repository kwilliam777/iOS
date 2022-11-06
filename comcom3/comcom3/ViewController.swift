//
//  ViewController.swift
//  comcom3
//
//  Created by 김응진 on 2022/11/06.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tf.placeholder = "please enter text"
        self.tf.keyboardType = UIKeyboardType.alphabet
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark
        self.tf.returnKeyType = UIReturnKeyType.default
        self.tf.enablesReturnKeyAutomatically = true
        
        self.tf.borderStyle = UITextField.BorderStyle.line
        self.tf.backgroundColor = UIColor(white:0.87, alpha: 1.0)
        self.tf .contentVerticalAlignment = .center
        self.tf.contentHorizontalAlignment = .center
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        self.tf.layer.borderWidth = 2.0
        
        self.tf.becomeFirstResponder()
        
        self.tf.delegate = self
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("text editing will be started")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("text editing started")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("text field text will be cleared")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string)==nil{
            if (textField.text?.count)! + string.count>10 {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
        print("text filed context will be changed to \(string)")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("text field return bt clicked")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("text field editing will be ended")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("text field editing ended")
    }

    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    
}

