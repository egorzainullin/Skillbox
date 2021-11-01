//
//  ViewController.swift
//  Task10
//
//  Created by Егор Зайнуллин on 30.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let cell = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 80))
        let label = UILabel(frame: cell.bounds)
        label.text = "Text"
        label.textAlignment = .center
        cell.addSubview(label)
        scrollView.addSubview(cell)

    }


}

