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
    
    let shared = Persistence.shared
    
    @IBAction func buttonTouchUpInside(_ sender: Any) {
        
        shared.name = nameTextField.text ?? ""
        shared.sursname = sursnameTextField.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sursnameTextField.text = shared.sursname
        nameTextField.text = shared.name
    }
}

