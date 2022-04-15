//
//  ViewController.swift
//  navbar_without_storyboard
//
//  Created by 김응진 on 2022/03/29.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "홈"
        self.view.backgroundColor = .yellow
        
        // 네비게이션 아이템 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: #selector(goToMessageVC))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(goToProfileVC))
    }

    @objc fileprivate func goToMessageVC() {
        print("MainViewController - gotomessageVC")
        let messageVC = messageViewController()
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    @objc fileprivate func goToProfileVC() {
        print("MainViewController - gotoProfileVC")
        let profileVC = profileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}

