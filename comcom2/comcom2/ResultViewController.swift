//
//  ResultViewController.swift
//  comcom2
//
//  Created by 김응진 on 2022/10/11.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    @IBOutlet var resultEmail2: UILabel!
    @IBOutlet var resultUpdate2: UILabel!
    @IBOutlet var resultInterval2: UILabel!
    
    //동기방식
//    var paramEmail2: String? = "None"
//    var paramUpdate2: Bool? = false
//    var paramInterval2: Double? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자옫갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    override func viewWillAppear(_ animated: Bool) {
        //동기방식 - 화면이 메모리에서 해제 되면 데이터도 삭제
//        if let email = paramEmail2 {
//            resultEmail2.text = email
//        }
//        if let update = paramUpdate2 {
//            resultUpdate2.text = update == true ? "자동갱신":"자동갱신안함"
//        }
//        if let interval = paramInterval2 {
//            resultInterval2.text = "\(Int(interval))분마다"
//        }
        
        //비동기 방식 - appdelegate - 앱이 종료되기 전까지는 데이저 삭제되지 않음
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        if let email = ad?.paramEmail{
//            resultEmail2.text = email
//        }
//        if let update = ad?.paramUpdate{
//            resultUpdate2.text = update == true ? "자동갱신" : "자동갱신안함"
//        }
//        if let interval = ad?.paramInterval{
//            resultInterval2.text = "\(Int(interval))분마다"
//        }
        
        //비동기 방식 - UserDefault - 앱이 삭제되기 전까지는 데이터 삭제되지 않음
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") {
            print(email)
            resultEmail2.text = email
        }
        let update = ud.bool(forKey: "isUpdate")
        print(update)
        resultUpdate2.text = (update == true ? "자동갱신":"자동갱신안함")
        let interval = ud.double(forKey: "interval")
        print(interval)
        resultInterval2.text = "\(Int(interval))분마다"
    }
    
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
