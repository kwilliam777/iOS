//
//  CustomPopUpViewController.swift
//  CustomPopUp
//
//  Created by 김응진 on 2022/04/02.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bgBt: UIButton!
    @IBOutlet weak var learnMoreBt: UIButton!
    
    var learnMoreBtCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("check cpuvc")
        contentView.layer.cornerRadius=30
        learnMoreBt.layer.cornerRadius=10
    }
    
    @IBAction func onBgBtClicked(_ sender: UIButton) {
        print("onBgBtClicked")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func learnMoreClicked(_ sender: UIButton) {
        print("leanrMoreClicked")
        self.dismiss(animated: true,completion: nil)
        
        // 컴플레션 블럭 호출
        if let learnMoreBtCompletionClosure = learnMoreBtCompletionClosure {
            // 메인에 알린다
            learnMoreBtCompletionClosure()
        }
    }
}
