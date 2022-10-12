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
    
    @IBOutlet var resultEmail2: UILabel!
    @IBOutlet var resultUpdate2: UILabel!
    @IBOutlet var resultInterval2: UILabel!
    
    var paramEmail2: String?
    var paramUpdate2: Bool?
    var paramInterval2: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자옫갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail2 {
            resultEmail2.text = email
        }
        if let update = paramUpdate2 {
            resultUpdate2.text = update == true ? "자동갱신":"자동갱신안합"
        }
        if let interval = paramInterval2 {
            resultInterval2.text = "\(Int(interval))분마다"
        }
    }
    
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
