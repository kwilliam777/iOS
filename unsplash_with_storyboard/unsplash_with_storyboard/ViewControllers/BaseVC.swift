//
//  BaseVC.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/07.
//

import UIKit

class BaseVC: UIViewController {
    var vcTitle: String = "" {
        didSet{
            print(" - vcTitle didSet() called, title: \(vcTitle)")
            self.title = vcTitle
        }
    }
}
