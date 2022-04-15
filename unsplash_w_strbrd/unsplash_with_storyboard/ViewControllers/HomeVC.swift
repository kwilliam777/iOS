//
//  HomeVC.swift
//  unsplash_with_storyboard
//
//  Created by 김응진 on 2022/04/04.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: BaseVC, UISearchBarDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBt: UIButton!
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    var keyboardDismissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: HomeVC.self, action: nil)
    
    //MARK: - override method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("HomeVC - viewDidLoad")
        
        // ui 설정
        config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.searchBar.becomeFirstResponder()
    }
    
    // 세그웨이로 넘어갈 때 발동이 되는거다!!!! 화면 전화할 때!!!! 화면 전환 전 준비다!!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case SEGUE_ID.USER_LIST_VC:
            let nextVC = segue.destination as! UserListVC
            guard let userInputValue = self.searchBar.text else { return }
            nextVC.vcTitle = userInputValue + " 🙋‍♂️"
        case SEGUE_ID.PHOTO_COLLECTION_VC:
            let nextVC = segue.destination as! PhotoCollectionVC
            guard let userInputValue = self.searchBar.text else { return }
            nextVC.vcTitle = userInputValue + " 🏞"
        default:
            print("default")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVC - viewWillAppear() called")
        
        // 키보드 노티 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called")
        
        // 키보드 노티 해제
        NotificationCenter.default.removeObserver(self,name:UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name:UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    //MARK: - fileprivate methods
    fileprivate func config() {
        // ui 설정
        self.searchBt.layer.cornerRadius = 10
        self.searchBar.searchBarStyle = .minimal
        
        // 델리겟 연결해줘야 텍스트가 바뀜을 인지한다
        self.searchBar.delegate = self
        self.keyboardDismissTabGesture.delegate = self
        
        // 제스쳐 추가
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
    }
    
    fileprivate func pushVC() {
        var sequeId: String = ""
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            print("사진")
            sequeId = "goToPhotoCollectionVC"
        case 1:
            print("사용자")
            sequeId = "goToUserListVC"
        default:
            print("사진")
            sequeId = "goToPhotoCollectionVC"
        }
        
        self.performSegue(withIdentifier: sequeId, sender: self)
    }
    
    @objc func keyboardWillShowHandle(notification: NSNotification){
        // 키보드 사이즈 가져오기
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            print("keyboard size")
            if (keyboardSize.height < searchBt.frame.origin.y) {
                print("키보드가 버튼을 덮었다")
                let distance = keyboardSize.height - searchBt.frame.origin.y
                self.view.frame.origin.y = distance + searchBt.frame.height
            }
        }
    }
    
    @objc func keyboardWillHideHandle() {
        self.view.frame.origin.y = 0
    }


    //MARK: - IBAction methods
    @IBAction func searchFilterValChange(_ sender: UISegmentedControl) {
        print("HomeVC - searchFilterValChange index \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = ""
        switch sender.selectedSegmentIndex{
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        
        self.searchBar.placeholder = searchBarTitle + " 입력"
        
        // 키보드에 포커싱 주기
        self.searchBar.becomeFirstResponder()
        // 키보드에 포커싱 빼기
//        self.searchBar.resignFirstResponder()
    }
    
    @IBAction func onSearchBtClicked(_ sender: Any) {
        print("mainVC - onSearchBtClicked index \(searchFilterSegment.selectedSegmentIndex)")
        
//        let url = API.BASE_URL + "search/photos"
//
        guard let userInput = self.searchBar.text else {return}
//
//        let queryParam = ["query": userInput,"client_id": API.CLIENT_ID]
        
//        AF.request(url, method: .get, parameters: queryParam).responseJSON(completionHandler: { response in
//            debugPrint(response)
//        })
        
        var urlToCall: URLRequestConvertible?
        
        switch searchFilterSegment.selectedSegmentIndex {
        case 0:
            urlToCall = MySearchRouter.searchPhotos(term: userInput)
            
        case 1:
            urlToCall = MySearchRouter.searchUsers(term: userInput)
        default:
            print("default")
        }
        
        if let urlConvertible = urlToCall{
            MyAlamofireManager
                .shared
                .session
                .request(urlConvertible)
                .validate(statusCode: 200...400)
                .responseJSON(completionHandler:  { response in
                    debugPrint(response)
                })
        }
        

        
        
        // 화면 이동
//        pushVC()
    }
    
    
    //MARK: - UISearchBar Delegate methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked()")
        
        guard let userInputString = searchBar.text else {return}
        
        if userInputString.isEmpty {
            self.view.makeToast("🥺 검색 키워드를 입력해주세요", duration:10, position: .top)
        } else {
            pushVC()
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText: \(searchText)")
        if (searchText.isEmpty) {
            self.searchBt.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.01, execute: {
                // 키보드 포커싱 해제
                self.searchBar.resignFirstResponder()
            })
        } else {
            self.searchBt.isHidden = false
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputTxtCount = searchBar.text?.appending(text).count ?? 0
        print("HomeVC - searchBar: \(inputTxtCount)")
        if (inputTxtCount >= 12) {
            // 토스트 설정
            self.view.makeToast("🥺 12자까지만 입력 가능합니다.", duration: 2.0, position: .top)
        }
        return inputTxtCount <= 12
    }
    
    
    //MARK: - UIGesturerecognizerDelegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("HomeVC - gestureRecognizer shouldReceive() called")
        // 에외사항을 적어준다. 버튼이나 토글
        if (touch.view?.isDescendant(of: searchFilterSegment) == true || touch.view?.isDescendant(of: searchBar) == true) {
            return false
        } else {
            view.endEditing(true)
            return true
        }
    }
}

