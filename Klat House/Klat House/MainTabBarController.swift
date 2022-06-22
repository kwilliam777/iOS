//
//  MainTabBarController.swift
//  Klat House
//
//  Created by 김응진 on 2022/06/16.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainTabBarController - viewDidLoad() called")

        UITabBar.appearance().barTintColor = .black
//        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().backgroundColor = .systemBackground
        
        let myProfileVC = MyViewController()
        let FAQVC = FAQViewController()
        let AroundVC = AroundViewController()
        let cautionVC = CautionViewController()
        
        self.viewControllers = [myProfileVC, FAQVC, AroundVC, cautionVC]
        
        let firstTabBarItem = UITabBarItem(title: "my", image: UIImage(systemName: "person.circle.fill"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "ask", image: UIImage(systemName: "message.fill"), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "around", image: UIImage(systemName: "map.fill"), tag: 2)
        let fourthTabBarItem = UITabBarItem(title: "caution", image: UIImage(systemName: "lightbulb.fill"), tag: 3)
     
        myProfileVC.tabBarItem = firstTabBarItem
        FAQVC.tabBarItem = secondTabBarItem
        AroundVC.tabBarItem = thirdTabBarItem
        cautionVC.tabBarItem = fourthTabBarItem
        
    }
    
}
