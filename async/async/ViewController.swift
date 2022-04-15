//
//  ViewController.swift
//  async
//
//  Created by 김응진 on 2022/03/29.
//

import UIKit
import GradientLoadingBar

class ViewController: UIViewController {
    
    var label:UILabel = {
        let lab = UILabel()
        lab.text = "로딩을 시작합니다"
        lab.textAlignment = .center
        lab.font = UIFont.boldSystemFont(ofSize: 40)
        lab.textColor = .red
        
        return lab
    }()
    
    let notchGradientLoadingBar = NotchGradientLoadingBar(
        height: 5.0
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "스토리보드 없이 시작하기"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        notchGradientLoadingBar.fadeIn()
        
        load(completion: {result in
            print(result)
            self.label.text = result
            self.notchGradientLoadingBar.fadeOut()
        })
    }
    
    fileprivate func load(completion: @escaping(String) -> ()) {
        print("load")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            completion("로딩이 끝났습니다")
        }
    }
}

