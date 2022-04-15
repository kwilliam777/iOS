//
//  LoginViewController.swift
//  reboot
//
//  Created by 김응진 on 2022/03/21.
//

import UIKit
import Lottie
import GoogleMobileAds

class LoginViewController: UIViewController,GADBannerViewDelegate {
    
    @IBOutlet weak var loginBtn: UIButton!
    
    //제목
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "center"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .blue
        
        return label
    }()
    
    let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "this is bottom"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        
        return label
    }()
    
    let animationView: AnimationView = {
        let animView = AnimationView(name: "gaonashi")
        animView.frame = CGRect(x:0,y:0,width:400,height:400)
        animView.contentMode = .scaleAspectFill

        return animView
    }()
    
    
    //뷰가 생성이 되었을 때
    override func viewDidLoad() {
        var bannerView: GADBannerView!
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        // In this case, we instantiate the banner with desired ad size.
         bannerView = GADBannerView(adSize: GADAdSizeBanner)

        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-7470137966205402/1907909622"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
//        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
       
        //애니메이션 실행
        animationView.play{ (finish) in
            print("end of animation")
            
            //애니메이션 지움
            self.animationView.removeFromSuperview()
            
            
//            self.view.backgroundColor = .lightGray
            
//            self.view.addSubview(self.titleLabel)
//            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            self.titleLabel.centerXAnchor.constraint(equalTo: self.vi3ew.centerXAnchor).isActive = true
//            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//
//            self.view.addSubview(self.secondLabel)
//            self.secondLabel.translatesAutoresizingMaskIntoConstraints = false
//            self.secondLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//            self.secondLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            
        }
        loginBtn.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)

        func addBannerViewToView(_ bannerView: GADBannerView) {
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
              [NSLayoutConstraint(item: bannerView,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: bottomLayoutGuide,
                                  attribute: .top,
                                  multiplier: 1,
                                  constant: 0),
               NSLayoutConstraint(item: bannerView,
                                  attribute: .centerX,
                                  relatedBy: .equal,
                                  toItem: view,
                                  attribute: .centerX,
                                  multiplier: 1,
                                  constant: 0)
              ])
           }
        
    }
    @objc fileprivate func moveToMainViewController() {
        print("LoginViewController - moveToMainViewController called")
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }

    //MARK: - GADBannerViewDelegate
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
    
}

