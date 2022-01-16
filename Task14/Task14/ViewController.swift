//
//  ViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sursnameTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        let shared = Persistence.shared
        shared.name = nameTextField.text ?? ""
        shared.sursname = sursnameTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let shared = Persistence.shared
        sursnameTextField.text = shared.sursname
        nameTextField.text = shared.name
    }
}

