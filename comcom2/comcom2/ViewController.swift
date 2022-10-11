//
//  ViewController.swift
//  comcom2
//
//  Created by 김응진 on 2022/10/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdateTxt: UILabel!
    @IBOutlet var intervalTxt: UILabel!
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateTxt.text = "갱신함"
        } else {
            self.isUpdateTxt.text = "갱신하지 않음"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalTxt.text = "\(value)분 마다"
    }
    
    //세그웨이로 값을 보낼 때
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination
        guard let rvc = dest as? ResultViewController else { return }
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    
    
    //버튼으로 값을 보낼 때
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
//        버튼으로 이동할 경우
//        self.present(rvc,animated: true)
        
//        네비게이션바로 이동할 경우
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
}

