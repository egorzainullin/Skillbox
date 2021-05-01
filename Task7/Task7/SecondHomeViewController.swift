//
//  SecondHomeViewController.swift
//  Task7
//
//  Created by Егор Зайнуллин on 28.04.2021.
//

import UIKit

class SecondHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var colorSelectedLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewContoller = segue.destination as? SecondSubViewController {
            destinationViewContoller.delegate = self
            print("delegate is set")
        }
    }

}

extension SecondHomeViewController: SecondSubViewControllerDelegate {
    func setColor(color: UIColor) {
        view.backgroundColor = color
        switch color {
        case .green:
            colorSelectedLabel?.text = "Green selected"
        case .blue:
            colorSelectedLabel?.text = "Blue selected"
        case .red:
            colorSelectedLabel?.text = "Red selected"
        default:
            colorSelectedLabel?.text = "Unknown color"
        }
    }
}
