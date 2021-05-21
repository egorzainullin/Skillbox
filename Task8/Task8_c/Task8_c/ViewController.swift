//
//  ViewController.swift
//  Task8_c
//
//  Created by Егор Зайнуллин on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view1View.isHidden = false
        view2View.isHidden = true
        view3View.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var segmentSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var view1View: UIView!
    
    @IBOutlet weak var view2View: UIView!
    
    @IBOutlet weak var view3View: UIView!
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        if let segment = sender as? UISegmentedControl, segment == segmentSegmentControl {
            if (segment.selectedSegmentIndex == 0)
            {
                view1View.isHidden = false
                view2View.isHidden = true
                view3View.isHidden = true
            }
            else if (segment.selectedSegmentIndex == 1) {
                view1View.isHidden = true
                view2View.isHidden = false
                view3View.isHidden = true
            }
            else if (segment.selectedSegmentIndex == 2) {
                view1View.isHidden = true
                view2View.isHidden = true
                view3View.isHidden = false
            }
        }
                
    }
    
}

