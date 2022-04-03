//
//  ViewController.swift
//  CustomPopUp
//
//  Created by 김응진 on 2022/04/02.
//

import UIKit
import WebKit

let notificationName = "btnClickNotification"

class ViewController: UIViewController,PopUpDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    //이게 노티피케이션 센터 지우는것
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 노티피케이션 이라는 방송 수신기를 장착한다.
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView),name: NSNotification.Name(rawValue: notificationName), object: nil)
        // 노티피케이션 센터는 등록을 하면 꼭!!! 해제도 해줘야한다
    }

    @objc fileprivate func loadWebView(){
        print("ViewController-loadWebView")
        let myinstaUrl = URL(string: "https://www.instagram.com/kwilliam777/?hl=en")
        self.myWebView.load(URLRequest(url:myinstaUrl!))
    }

    @IBAction func createPopUpBtclicked(_ sender: UIButton) {
        print("ViewController - CPUBT")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        // 스토리보드를 통해서 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        // 뷰 컨트롤러가 보여지는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        // 뷰 컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.learnMoreBtCompletionClosure = {
            print("컴플리션 블럭 호출")
//            self.createPopUpBtn.isHidden = true
            let myChannelUrl = URL(string: "https://kwilliam777.github.io/devportfolio/")
            self.myWebView.load(URLRequest(url:myChannelUrl!))
        }
        
        customPopUpVC.myPopUpDelegate = self
        
        self.present(customPopUpVC,animated: true, completion: nil)
    }
    
    //MARK: - PopUpDelegate method
    func fbBtClicked() {
        print("ViewController - fbBtClicked")
        let myfacebookUrl = URL(string: "https://www.facebook.com/william.kim.5015")
        self.myWebView.load(URLRequest(url:myfacebookUrl!))
    }
}

