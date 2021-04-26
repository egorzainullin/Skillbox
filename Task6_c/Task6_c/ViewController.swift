//
//  ViewController.swift
//  Task6_c
//
//  Created by Егор Зайнуллин on 26.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var answerLabel: UILabel!        

    @IBOutlet weak var firstOperandTextField: UITextField!

    @IBOutlet weak var operatorTextField: UITextField!

    @IBOutlet weak var secondOperandTextField: UITextField!
    
    private let invalidDataString = "Invalid data"
    
    private func plus(a: Int, b: Int) -> Int {
        return a + b
    }
    
    private func minus(a: Int, b: Int) -> Int {
        return a - b
    }
    
    private func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    private func divide(a: Int, b: Int) -> Double {
        return Double(a) / Double(b)
    }
    
    @IBAction func OnButtonTouchUpInside(_ sender: Any) {
        if let operatorLiteral = operatorTextField.text {
            let firstOperandString = firstOperandTextField.text ?? ""
            let secondOperandString = secondOperandTextField.text ?? ""
            switch (Int(firstOperandString), Int(secondOperandString)) {
            case (let a?, let b?):
                switch operatorLiteral {
                case "+": answerLabel.text = String(plus(a: a, b: b))
                case "-": answerLabel.text = String(minus(a: a, b: b))
                case "*": answerLabel.text = String(multiply(a: a, b: b))
                case "/":
                    if (b != 0) {
                        answerLabel.text = String(divide(a: a, b: b))
                    }
                    else {
                        answerLabel.text = invalidDataString
                    }
                default:
                    answerLabel.text = invalidDataString
                }
            default:
                answerLabel.text = invalidDataString
            }
        }
        else {
            answerLabel.text = invalidDataString
        }
    }
    
    
}

