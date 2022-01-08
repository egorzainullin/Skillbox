//
//  CustomSegmentControl.swift
//  Task11
//
//  Created by Егор Зайнуллин on 07.01.2022.
//

import UIKit

protocol CustomSegmentControlDelegate: NSObjectProtocol {
    func leftButtonSelected(_ segmentControl: CustomSegmentControl)

    func rightButtonSelected(_ segmentControl: CustomSegmentControl)
}

//@IBDesignable
class CustomSegmentControl: UIView {
    @IBInspectable var leftTitle = "Left"
    { didSet { updateLeftTitle(leftTitle)} }
    
    @IBInspectable var rightTitle = "Right"
    { didSet { updateRightTitle(rightTitle)} }
    
    @IBInspectable var borderColor = UIColor.green
    { didSet { updateBorderColor(borderColor)} }
    
    @IBInspectable var selectedButtonColor = UIColor.white
    { didSet { updateButtonColor(selectedButtonColor) } }
    
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
            isSetuped = true
        }
        else {
            updateLeftTitle(leftTitle)
            updateRightTitle(rightTitle)
            updateBorderColor(borderColor)
            updateButtonColor(selectedButtonColor)
        }
    }
    
    private func updateLeftTitle(_ title: String) {
        leftButton.setTitle(title, for: .normal)
    }
    
    private func updateRightTitle(_ title: String) {
        rightButton.setTitle(title, for: .normal)
    }
    
    private func updateBorderColor(_ color: UIColor) {
        leftButton.layer.borderColor = color.cgColor
        rightButton.layer.borderColor = color.cgColor
    }
    
    private func updateButtonColor(_ color: UIColor) {
        leftButton.backgroundColor = color
        rightButton.backgroundColor = color
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
    
    private var isLeftSelected = true
    
    @objc
    private func leftButtonClicked(_ sender: UIButton!) {
        if (!isLeftSelected){
            leftButton.layer.backgroundColor = UIColor.clear.cgColor
            UIView.animate(withDuration: 0.5, animations: {
                self.leftButton.backgroundColor = self.selectedButtonColor
            })
            rightButton.layer.backgroundColor = UIColor.clear.cgColor
            UIView.animate(withDuration: 0.5, animations: {
                self.rightButton.backgroundColor = self.notSelectedButtonColor
            })
            isLeftSelected = true
            delegate?.leftButtonSelected(self)
        }
    }
    
    @objc
    private func rightButtonClicked(_ sender: UIButton!) {
        if isLeftSelected
        {
            leftButton.layer.backgroundColor = UIColor.clear.cgColor
            UIView.animate(withDuration: 0.5, animations: {
                self.leftButton.backgroundColor = self.notSelectedButtonColor
            })
            rightButton.layer.backgroundColor = UIColor.clear.cgColor
            UIView.animate(withDuration: 0.5, animations: {
                self.rightButton.backgroundColor = self.selectedButtonColor
            })
                isLeftSelected = false
            delegate?.rightButtonSelected(self)
        }
    }
}
