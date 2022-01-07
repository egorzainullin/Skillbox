//
//  ButtonView.swift
//  Task11
//
//  Created by Егор Зайнуллин on 06.01.2022.
//

import UIKit

//@IBDesignable
class ButtonView: UIView {
    
    private var isSetuped = false
    
    @IBInspectable
    var width: CGFloat = 100.0
    { didSet { updateWidth(width) }}
    
    @IBInspectable
    var radius: CGFloat = 10.0
    { didSet { updateRadius(radius) } }
    
    @IBInspectable
    var edgeColor: UIColor = .green
    { didSet { updateColor(edgeColor) } }
    
    private func updateWidth(_ width: CGFloat) {
        frame.size.width = width
        layoutIfNeeded()
    }
    
    private func updateColor(_ color: UIColor) {
        backgroundColor = color
        layoutIfNeeded()
    }
    
    private func updateRadius(_ radius: CGFloat)
    {
        if (radius > delta)
        {
            layer.cornerRadius = radius
            button.layer.cornerRadius = radius - delta
        }
        layoutIfNeeded()
    }
    
    private let button = UIButton()
    
    private let delta = 1.0

    override func layoutSubviews() {
        if (!isSetuped)
        {
            let w = frame.size.width
            let h = 50.0
            updateRadius(radius)
            frame.size.height = h
            backgroundColor = .green
            button.frame = CGRect(x: delta, y: delta, width: w - 2 * delta, height: h - 2 * delta)
            button.backgroundColor = .white
            button.setTitleColor(.systemBlue,
                                 for: .normal)
            button.setTitle("Test", for: .normal)
            button.addTarget(self,
                             action: #selector(buttonAction),
                             for: .touchUpInside)
            addSubview(button)
            isSetuped = true
        }
        else {
            updateRadius(radius)
            updateWidth(width)
            updateColor(edgeColor)
        }
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
}
