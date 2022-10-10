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
    }
    @IBAction func onStepper(_ sender: UIStepper) {
    }
    
}

