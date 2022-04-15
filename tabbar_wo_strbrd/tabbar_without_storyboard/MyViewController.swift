//
//  MyViewController.swift
//  tabbar_without_storyboard
//
//  Created by 김응진 on 2022/03/29.
//

import UIKit

class MyViewController: UIViewController {
    
    convenience init(title: String, bgColor: UIColor) {
        self.init()
        self.title = title
        self.view.backgroundColor = bgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

