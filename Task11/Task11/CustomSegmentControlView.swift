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
    @IBInspectable var leftTitle = "Left"
    
    @IBInspectable var rightTitle = "Right"
    
    @IBInspectable var borderColor = UIColor.green
    
    @IBInspectable var selectedButtonColor = UIColor.white
    
    weak var delegate: CustomSegmentControlDelegate?
    
    private var isSetuped = false
    
    private let notSelectedButtonColor = UIColor.systemGray5
    
    private let cornerRadius = 10.0
    
    private let borderWidth = 1.0
    
    private var leftButton = UIButton()
    
    private var rightButton = UIButton()
    
    override func layoutSubviews() {
        if (!isSetuped)
        {
            let frameWidth = frame.size.width
            let frameHeight = 40.0
            leftButton = createButton(title: leftTitle)
            leftButton.addTarget(self,
                             action: #selector(leftButtonClicked),
                             for: .touchUpInside)
            leftButton.frame = CGRect(x: 0.0, y: frameHeight / 2, width: frameWidth / 2, height: frameHeight)
            addSubview(leftButton)
            rightButton = createButton(title: rightTitle)
            rightButton.addTarget(self,
                             action: #selector(rightButtonClicked),
                             for: .touchUpInside)
            rightButton.frame = CGRect(x: frameWidth / 2, y: frameHeight / 2, width: frameWidth / 2, height: frameHeight)
            leftButton.backgroundColor = selectedButtonColor
            addSubview(rightButton)
        }
        else {
            isSetuped = true
        }
    }
    
    private func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = notSelectedButtonColor
        button.setTitleColor(.systemBlue,
                             for: .normal)
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        button.setTitle(title, for: .normal)
        return button
    }
    
    @objc
    private func leftButtonClicked(_ sender: UIButton!) {
        leftButton.layer.backgroundColor = UIColor.clear.cgColor
        UIView.animate(withDuration: 0.5, animations: {
            self.leftButton.backgroundColor = self.notSelectedButtonColor
        })
        rightButton.layer.backgroundColor = UIColor.clear.cgColor
        UIView.animate(withDuration: 0.5, animations: {
            self.rightButton.backgroundColor = self.selectedButtonColor
        })
        delegate?.leftButtonPressed(self)
    }
    
    @objc
    private func rightButtonClicked(_ sender: UIButton!) {
        leftButton.layer.backgroundColor = UIColor.clear.cgColor
        UIView.animate(withDuration: 0.5, animations: {
            self.leftButton.backgroundColor = .systemGray5
        })
        rightButton.layer.backgroundColor = UIColor.clear.cgColor
        UIView.animate(withDuration: 0.5, animations: {
            self.rightButton.backgroundColor = .white
        })
        delegate?.rightButtonPressed(self)
    }
}
