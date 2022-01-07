//
//  CustomSegmentControl.swift
//  Task11
//
//  Created by Егор Зайнуллин on 07.01.2022.
//

import UIKit

protocol CustomSegmentControlDelegate: NSObjectProtocol {
    func leftButtonPressed(_ segmentControl: CustomSegmentControl)

    func rightButtonPressed(_ segmentControl: CustomSegmentControl)
}

@IBDesignable
class CustomSegmentControl: UIView {

    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
   
    @IBAction func leftButtonClicked(_ sender: Any) {
        delegate?.leftButtonPressed(self)
    }
    
    @IBAction func rightButtonClicked(_ sender: Any) {
        delegate?.rightButtonPressed(self)
    }
    
    weak var delegate: CustomSegmentControlDelegate?
    
    private var isSetuped = false
    
    override func layoutSubviews() {
        if (!isSetuped)
        {
            let cornerRadius = 10.0
            leftButton.layer.cornerRadius = cornerRadius
            rightButton.layer.cornerRadius = cornerRadius
        }
        isSetuped = true
    }
    
    static func loadFromNib() -> CustomSegmentControl {
        let nibName = "CustomSegmentControl"
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! CustomSegmentControl
    }
}
