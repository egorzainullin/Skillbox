//
//  ViewController.swift
//  Task6_a
//
//  Created by Егор Зайнуллин on 16.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var namesLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func onTouchUp(_ sender: Any) {
        switch (nameTextField.text, namesLabel.text) {
        case (""?, let names?):
            namesLabel.text = names
        case (let name?, let names?):
            namesLabel.text = name + " " + names
        case (let name?, _):
            namesLabel.text = name
        case (_, let names?):
            namesLabel.text = names
        default:
            namesLabel.text = ""
        }
    }

}

