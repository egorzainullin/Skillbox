//
//  ThirdContentViewController.swift
//  Task7
//
//  Created by Егор Зайнуллин on 01.05.2021.
//

import UIKit

protocol ThirdContentViewControllerDelegate {
    func setColor(_ color: UIColor?)
}

class ThirdContentViewController: UIViewController {
 
    var color: UIColor?
    {
        didSet {
            view.backgroundColor = color
        }
    }
    
    @IBAction func onGreenButtonTouchUp(_ sender: Any) {
        delegate?.setColor(.green)
    }
    
    @IBAction func onYellowButtonTouchUp(_ sender: Any) {
        delegate?.setColor(.yellow)
    }
    
    @IBAction func onPurpleButtonTouchUp(_ sender: Any) {
        delegate?.setColor(.purple)
    }
    
    var delegate: ThirdContentViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
