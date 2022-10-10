//
//  ViewController.swift
//  comcom2
//
//  Created by 김응진 on 2022/10/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdateTxt: UILabel!
    @IBOutlet var intervalTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateTxt.text = "갱신함"
        } else {
            self.isUpdateTxt.text = "갱신하지 않음"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalTxt.text = "\(value)분 마다"
    }
    
}

