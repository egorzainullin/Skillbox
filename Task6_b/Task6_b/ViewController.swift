//
//  ViewController.swift
//  Task6_b
//
//  Created by Егор Зайнуллин on 16.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    let warning = "Input integer number"
    
    func degreeOfTwo(n: Int) -> Double {
        func degreeOfTwoInt(n: Int) -> Int {
            var degree = 1
            for _ in 1...n
            {
                degree *= 2
            }
            return degree
        }
        switch n {
        case let negativeN where negativeN < 0:
            return 1.0 / Double(degreeOfTwoInt(n: -negativeN))
        case 0:
            return 1.0
        default:
            return Double(degreeOfTwoInt(n: n))
        }
    }
    
    @IBAction func onButtonTouchUp(_ sender: Any) {
        if let nString = numberTextField.text {
            if let n = Int(nString) {
                messageLabel.text = String(degreeOfTwo(n: n))
            }
            else {
                messageLabel.text = warning
            }
        }
        else {
            messageLabel.text = warning
        }
    }
}

