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
    
    var color: UIColor?
    {
        didSet {
            view.backgroundColor = color
        }
    }
        
    @IBAction func onGreenButtonTouchUp(_ sender: Any) {
        color = .green
        contentViewController?.color = color
    }
    
    @IBAction func onYellowButtonTouchUp(_ sender: Any) {
        color = .yellow
        contentViewController?.color = color
    }
    
    @IBAction func onPurpleButtonTouchUp(_ sender: Any) {
        color = .purple
        contentViewController?.color = color
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ThirdContentViewController {
            contentViewController = destinationViewController
            contentViewController?.delegate = self
            contentViewController?.color = color
        }
    }
}

extension ThirdViewController: ThirdContentViewControllerDelegate {
    func setColor(_ color: UIColor?) {
        self.color = color
    }
}
