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
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in self.result.text = "취소버튼을 클릭!"}
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in self.result.text = "확인버튼을 클릭!"}
        let exec = UIAlertAction(title: "실행", style: .destructive) { (_) in self.result.text = "실행버튼을 클릭!"}
        let stop = UIAlertAction(title: "중지", style: .default) { (_) in self.result.text = "중지버튼을 클릭!"}
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Stroe에 로그인"
        let message = "사용자의 Apple ID sqlpro@naver.com의 암호를 입력하십시오"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            if let tf = alert.textFields?[0] {
                print("입력된 값은 \(tf.text!) 입니다.")
            } else {
                print("입력된 값이 없습니다.")
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert,animated: true)
        
    }
    
    
}
