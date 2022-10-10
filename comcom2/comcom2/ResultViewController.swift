//
//  ResultViewController.swift
//  comcom2
//
//  Created by 김응진 on 2022/10/11.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
