//
//  ViewController.swift
//  imagePicker
//
//  Created by 김응진 on 2022/04/03.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileChangeBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 프로필을 원으로 만들기 위함
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileChangeBt.layer.cornerRadius = 10
        
        self.profileChangeBt.addTarget(self, action: #selector(onProfileChangeBtClicked), for: .touchUpInside)
    }

    @objc fileprivate func onProfileChangeBtClicked(){
        print("viewController - onprofilechangebtclicked")
        
        // 카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
//        config.screens = [.library, .photo, .video]
        config.screens = [.library]
        
        let picker = YPImagePicker(configuration: config)
        
        // 사진이 선택되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                // 요기서 내 로직을 넣으면 됨
                self.profileImage.image = photo.image
            }
            // 선택 창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        // 선택 창 열기
        present(picker, animated: true, completion: nil)
    }
}

