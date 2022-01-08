//
//  ViewController.swift
//  Task11
//
//  Created by Егор Зайнуллин on 06.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customSegmentControl: CustomSegmentControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customSegmentControl.delegate = self
    }
}

extension ViewController: CustomSegmentControlDelegate {
    func leftButtonSelected(_ segmentControl: CustomSegmentControl) {
        print("left button pressed")
    }
    
    func rightButtonSelected(_ segmentControl: CustomSegmentControl) {
        print("right button pressed")
    }
    
    
}

