//
//  LoginViewController.swift
//  reboot
//
//  Created by 김응진 on 2022/03/21.
//

import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    
    //제목
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "center"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .blue
        
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "this is bottom"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        
        return label
    }()
    
    let animationView: AnimationView = {
        let animView = AnimationView(name: "gaonashi")
        animView.frame = CGRect(x:0,y:0,width:400,height:400)
        animView.contentMode = .scaleAspectFill
        
        return animView
    }()
    
    
    //뷰가 생성이 되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
       
        //애니메이션 실행
        animationView.play{ (finish) in
            print("end of animation")
            
            //애니메이션 지움
            self.animationView.removeFromSuperview()
            
            self.navigationController?.isNavigationBarHidden = true
            
            
            
//            self.view.backgroundColor = .lightGray
            
//            self.view.addSubview(self.titleLabel)
//            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//            self.view.addSubview(self.secondLabel)
//            self.secondLabel.translatesAutoresizingMaskIntoConstraints = false
//            self.secondLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//            self.secondLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
        }
        loginBtn.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)

    }
    @objc fileprivate func moveToMainViewController() {
        print("LoginViewController - moveToMainViewController called")
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }

}

