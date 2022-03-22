//
//  ViewController.swift
//  reboot
//
//  Created by 김응진 on 2022/03/21.
//

import UIKit

class MainViewController: UIViewController {
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
    
    //뷰가 생성이 되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .lightGray
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}

