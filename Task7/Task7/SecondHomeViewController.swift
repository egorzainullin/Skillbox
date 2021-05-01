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
        self.color = .green
        colorSelectedLabel.text = "Green selected"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var colorSelectedLabel: UILabel!
    
    var color: UIColor?
    {
        didSet {
            if let unwrappedColor = color {
                view.backgroundColor = unwrappedColor
            }
            else {
                color = .green
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewContoller = segue.destination as? SecondSubViewController {
            destinationViewContoller.delegate = self
            if let unwrappedColor = color {
                destinationViewContoller.color = unwrappedColor
            }
            print("delegate is set")
        }
    }

}

extension SecondHomeViewController: SecondSubViewControllerDelegate {
    func setColor(color: UIColor) {
        self.color = color
        print(color)
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
