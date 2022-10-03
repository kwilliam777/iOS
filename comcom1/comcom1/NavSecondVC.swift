//
//  NavSecondVC.swift
//  comcom1
//
//  Created by 김응진 on 2022/10/03.
//

import UIKit

class NavSecondVC : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
