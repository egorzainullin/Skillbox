//
//  ViewController.swift
//  Task8_a
//
//  Created by Егор Зайнуллин on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagesImageView: UIImageView!
    
    let catsImagesPath = [ "cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9", "cat10" ]
    
    @IBOutlet weak var previosButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    var images: [UIImage] = []
    
    var imageIterator = 0
    
    @IBAction func onPreviousButtonToucUpInside(_ sender: Any) {
        imageIterator -= 1
        imagesImageView.image = images[imageIterator]
        if (imageIterator == 0) {
            previosButton.isEnabled = false
        }
        nextButton.isEnabled = true
    }
    
    @IBAction func onNextButtonTouchUpInside(_ sender: Any) {
        imageIterator += 1
        imagesImageView.image = images[imageIterator]
        if (imageIterator == images.count - 1) {
            nextButton.isEnabled = false
        }
        previosButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previosButton.isEnabled = false
        for name in catsImagesPath {
            let imageOptional = UIImage(named: name)
            if let image = imageOptional {
                images.append(image)
            }
        }
        imagesImageView.image = images[imageIterator]
        // Do any additional setup after loading the view.
    }
}

