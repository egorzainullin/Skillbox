//
//  SecondSubViewController.swift
//  Task7
//
//  Created by Егор Зайнуллин on 30.04.2021.
//

import UIKit

protocol SecondSubViewControllerDelegate {
    func setColor(color: UIColor)
}

class SecondSubViewController: UIViewController {

    var delegate: SecondSubViewControllerDelegate?
    
    var color: UIColor = .green
    {
        didSet {
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
    
    @IBOutlet weak var colorSelectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onGreenSelected(_ sender: Any) {
        color = .green
        navigationController?.popViewController(animated: true)
        delegate?.setColor(color: color)
    }
    
    @IBAction func onBlueSelected(_ sender: Any) {
        color = .blue
        navigationController?.popViewController(animated: true)
        delegate?.setColor(color: color)
    }
    
    @IBAction func onRedSelected(_ sender: Any) {
        color = .red
        navigationController?.popViewController(animated: true)
        delegate?.setColor(color: color)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
