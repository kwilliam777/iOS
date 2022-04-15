//
//  BaseVC.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/07.
//

import UIKit
import Toast_Swift

class BaseVC: UIViewController {
    var vcTitle: String = "" {
        didSet{
            print(" - vcTitle didSet() called, title: \(vcTitle)")
            self.title = vcTitle
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 인증 실패 노티피케이션 등록
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 인증 실패 노티피케이션 해제
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    //MARK: - objc method
    @objc func showErrorPopup(notification: NSNotification) {
        print("BaseVC - showErrorPopup")
        
        if let data = notification.userInfo?["statusCode"] {
            print("showErrorPopup data: \(data)")
            
            // 메인 스레드에서 돌리기, 즉 ui 스레드
            DispatchQueue.main.async {
                self.view.makeToast("🫥 \(data) 에러입니다", duration:1.5, position: .top)
            }
            
            
        }
    }
}
