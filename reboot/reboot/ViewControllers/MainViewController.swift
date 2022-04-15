//
//  MainViewController.swift
//  reboot
//
//  Created by 김응진 on 2022/03/22.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    //제목
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Main View"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label
    }()
    
    let changeBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("배경색 바꿔라", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 5
        btn.contentEdgeInsets = UIEdgeInsets(top:5, left:20, bottom:5, right:20)
        btn.addTarget(self, action: #selector(changeBG), for: .touchUpInside)
        
        return btn
    }()
    
    var isBGorange: Bool?
    
    //뷰 생성
    override func viewDidLoad() {
        super.viewDidLoad()
        isBGorange = true
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(changeBtn)
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    }
    
    //배경색을 바꾼다
    @objc fileprivate func changeBG() {
        
        if isBGorange == true {
            view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            isBGorange = false
        } else {
            view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            isBGorange = true
        }
        print("mainViewController - changeBT \(String(describing: isBGorange))")
    }
}
