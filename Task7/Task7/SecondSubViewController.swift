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
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onGreenSelected(_ sender: Any) {
        view.backgroundColor = .green
        navigationController?.popViewController(animated: true)
        delegate?.setColor(color:. green)
    }
    
    @IBAction func onBlueSelected(_ sender: Any) {
        view.backgroundColor = .blue
        navigationController?.popViewController(animated: true)
        delegate?.setColor(color:. green)
    }
    
    @IBAction func onRedSelected(_ sender: Any) {
        view.backgroundColor = .red
        navigationController?.popViewController(animated: true)
        delegate?.setColor(color:. green)
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