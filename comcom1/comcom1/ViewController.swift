//
//  ViewController.swift
//  comcom1
//
//  Created by 김응진 on 2022/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet var l1: UILabel!
    @IBOutlet var l2: UILabel!
    @IBOutlet var l3: UILabel!
    @IBOutlet var l4: UILabel!
    @IBOutlet var l5: UILabel!
    
    
    @IBAction func bt1(_ sender: Any) {
    }
    
    
    
    
    
    @IBAction func uiBtn(_ sender: Any) {
        if self.uiTitle.text=="첫번째 화면"{
            self.uiTitle.text = "Hello, World!"
        } else if self.uiTitle.text == "Hello, World!" {
            self.uiTitle.text = "Bye, World!"
        } else {
            self.uiTitle.text = "첫번째 화면"
        }
    }
}

