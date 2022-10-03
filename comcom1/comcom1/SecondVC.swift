//
//  SecondVC.swift
//  comcom1
//
//  Created by 김응진 on 2022/10/03.
//

import UIKit

class SecondVC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btClicked(_ sender:Any) {
        self.presentingViewController?.dismiss(animated: true)
        
    }
}
