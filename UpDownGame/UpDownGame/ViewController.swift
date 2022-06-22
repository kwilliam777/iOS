//
//  ViewController.swift
//  UpDownGame
//
//  Created by 김응진 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {
    var ranVal: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minValLabel: UILabel!
    @IBOutlet weak var maxValLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage( UIImage(imageLiteralResourceName: "slider_thumb") , for: .normal)
        reset()
    }
    
    func reset() {
        print("reset func called")
        ranVal = Int.random(in: 0...30)
        print(ranVal)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minValLabel.text = "0"
        maxValLabel.text = "30"
        sliderValueLabel.text = "15"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.reset()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitVal: Int = Int(slider.value)
        slider.value = Float(hitVal)
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        if tryCount==5{
            showAlert(message: "You lose...")
            print("You lose..")
            reset()
        } else if hitVal == ranVal {
            showAlert(message: "YOU HIT!!!")
            print("you hit!")
            reset()
        } else if hitVal < ranVal {
            slider.minimumValue = slider.value
            minValLabel.text = String(Int(slider.minimumValue))
        } else {
            slider.maximumValue = slider.value
            maxValLabel.text = String(Int(slider.maximumValue))
        sliderValueLabel.text = String(Int(hitVal))
        slider.value = Float(hitVal)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
}

