//
//  FormViewController.swift
//  comcom2
//
//  Created by 김응진 on 2022/10/12.
//

import UIKit

class FormViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    

    @IBAction func onSubmit(_ sender: Any) {
        print("1")
        let preVC = self.presentingViewController
        print("2")
        guard let vc = preVC as? ResultViewController else {
            print("3")
            print(type(of:preVC as? ResultViewController))
            return
        }
        print("4")
        vc.paramEmail2 = self.email.text
        vc.paramUpdate2 = self.isUpdate.isOn
        vc.paramInterval2 = self.interval.value
        print(vc.paramEmail2,vc.paramUpdate2,vc.paramInterval2)
        self.presentingViewController?.dismiss(animated: true)
    }
}
