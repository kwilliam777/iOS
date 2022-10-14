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
    @IBOutlet var result: UILabel!
    
    @IBAction func onSubmit(_ sender: Any) {
          //동기방식 - 화면이 메모리에서 삭제되면 데이터도 삭제됨
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ResultViewController else {
//            print(type(of:preVC as? ResultViewController))
//            return
//        }
//        vc.paramEmail2 = self.email.text
//        vc.paramUpdate2 = self.isUpdate.isOn
//        vc.paramInterval2 = self.interval.value
//        print(vc.paramEmail2,vc.paramUpdate2,vc.paramInterval2)
        
        //비동기 방식 - app delegate - 앱이 종료되면 데이터도 삭제됨
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value

        //비동기 방식 - UserDefaults - 앱이 삭제되면 데이터도 삭제됨
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    
    
}
