//
//  ViewController.swift
//  Task13
//
//  Created by Егор Зайнуллин on 13.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animate(1)
    }

    @IBAction func previousButtonTouchUpInside(_ sender: Any) {
        if numberOfAnimation ==  1 {
            numberOfAnimation = 7
        }
        else {
            numberOfAnimation -= 1
        }
        animate(numberOfAnimation)
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any) {
        if numberOfAnimation == 7 {
            numberOfAnimation = 1
        }
        else {
            numberOfAnimation += 1
        }
        animate(numberOfAnimation)
    }
    
    @IBOutlet weak var numberOfAnimationLabel: UILabel!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var centerConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var redSquareView: UIView!
    
    private var numberOfAnimation = 1
    
    private func getRedSquareWidth() -> CGFloat {
        return redSquareView.frame.width
    }
    
    private func reset()
    {
        self.view.layer.removeAllAnimations()
        topConstraint.constant = 30
        centerConstraint.constant = 0
        redSquareView.backgroundColor = .red
        redSquareView.alpha = 1
        self.redSquareView.transform = CGAffineTransform(rotationAngle: 0)
        view.layoutIfNeeded()
    }
    
    private func animateBackground() {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: .curveEaseInOut) {
            self.redSquareView.backgroundColor = .yellow
        } completion: { isCompleted in
            self.reset()
        }

    }
    
    private func animateToRightUpCorner() {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: .curveEaseInOut) {
            let width = self.getRedSquareWidth()
            self.topConstraint.constant = 0
            self.centerConstraint.constant = self.view.frame.width / 2 - width / 2
            self.view.layoutIfNeeded()
        } completion: { isCompleted in
            self.reset()
        }
    }
    
    private func animateIntoCircle() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0
        animation.toValue = getRedSquareWidth() / 2
        animation.duration = 2
        redSquareView.layer.add(animation, forKey: "cornerRadius")
    }
    
    private func animateAnglePiRotation() {
        UIView.animate(withDuration: 2) {
            self.redSquareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } completion: { isCompleted in
            self.reset()
        }
    }
    
    private func animateDisappearing() {
        UIView.animate(withDuration: 2) {
            self.redSquareView.alpha = 0
        } completion: { isCompleted in
            self.reset()
        }
    }
    
    private func animateDoubleSizeAndReverse() {
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) { [self] in
            self.redSquareView.frame.size =
            CGSize(width: getRedSquareWidth() * 2, height: getRedSquareWidth())
        }
    }
    
    private func animateInfiniteRotation() {
        UIView.animate(withDuration: 0.8, delay: 0, options: [.repeat, .curveLinear]) {
            self.redSquareView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
    }
 
    private func animate(_ numberOfAnimation: Int) {
        reset()
        numberOfAnimationLabel.text = String(numberOfAnimation)
        switch numberOfAnimation {
        case 1:
            animateBackground()
        case 2:
            animateToRightUpCorner()
        case 3:
            animateIntoCircle()
        case 4:
            animateAnglePiRotation()
        case 5:
            animateDisappearing()
        case 6:
            animateDoubleSizeAndReverse()
        case 7:
            animateInfiniteRotation()
        default:
            debugPrint("Unknown number of animation")
        }
    }
    
    
}

