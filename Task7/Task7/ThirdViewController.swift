//
//  ThirdViewController.swift
//  Task7
//
//  Created by Егор Зайнуллин on 01.05.2021.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    var contentViewController: ThirdContentViewController?
        
    @IBAction func onGreenButtonTouchUp(_ sender: Any) {
        contentViewController?.color = .green
    }
    
    @IBAction func onYellowButtonTouchUp(_ sender: Any) {
        contentViewController?.color = .yellow
    }
    
    @IBAction func onPurpleButtonTouchUp(_ sender: Any) {
        contentViewController?.color = .purple
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ThirdContentViewController {
            contentViewController = destinationViewController
            contentViewController?.delegate = self
        }
    }
}

extension ThirdViewController: ThirdContentViewControllerDelegate {
    func setColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
}
