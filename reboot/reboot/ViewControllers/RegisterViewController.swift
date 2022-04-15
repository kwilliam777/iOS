//
//  RegisterViewController.swift
//  reboot
//
//  Created by 김응진 on 2022/03/21.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var btnForLoginViewController: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //상단 네비게이션 부분을 숨김처리
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerBtnClicked() called")
        
        //네비게이션 뷰 컨트롤러를 팝한다
        self.navigationController?.popViewController(animated: true)
    }
}
