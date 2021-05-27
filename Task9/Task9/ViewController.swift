//
//  ViewController.swift
//  Task9
//
//  Created by Егор Зайнуллин on 27.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labelHeight: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
    
    var buttonClickedOnce = false
    
    @IBAction func onButtonTouchUpInside(_ sender: Any) {
        buttonClickedOnce = !buttonClickedOnce
        if buttonClickedOnce {
            labelHeight.constant = label.font.pointSize * 6
            print("log")
        }
        else {
            labelHeight.constant = label.font.pointSize
        }
    }
}

