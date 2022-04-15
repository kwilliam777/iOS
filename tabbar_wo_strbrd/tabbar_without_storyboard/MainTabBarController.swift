//
//  MainTabBarController.swift
//  tabbar_without_storyboard
//
//  Created by 김응진 on 2022/03/29.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("check MainTabBarController called")
        
        let firstNC = UINavigationController.init(rootViewController: MyViewController(title: "포스팅", bgColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
        let secondNC = UINavigationController.init(rootViewController: MyViewController(title: "메세지", bgColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
        let thirdNC = UINavigationController.init(rootViewController: MyViewController(title: "친구", bgColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
        let fourthNC = UINavigationController.init(rootViewController: MyViewController(title: "프로필", bgColor: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        let fifthNC = UINavigationController.init(rootViewController: MyViewController(title: "설정", bgColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))

        self.viewControllers = [firstNC,secondNC,thirdNC,fourthNC,fifthNC]

        let firstItem = UITabBarItem(title: "포스팅", image: UIImage(systemName: "mail.stack.fill"),tag: 0)
        let secondItem = UITabBarItem(title: "메세지", image: UIImage(systemName: "bubble.right.fill"),tag: 1)
        let thirdItem = UITabBarItem(title: "친구", image: UIImage(systemName: "person.2.fill"),tag: 2)
        let fourthItem = UITabBarItem(title: "프로필", image: UIImage(systemName: "brain.head.profile"),tag: 3)
        let fifthItem = UITabBarItem(title: "설정", image: UIImage(systemName: "cube.transparent.fill"),tag: 4)

        firstNC.tabBarItem = firstItem
        secondNC.tabBarItem = secondItem
        thirdNC.tabBarItem = thirdItem
        fourthNC.tabBarItem = fourthItem
        fifthNC.tabBarItem = fifthItem
  
    }
}
