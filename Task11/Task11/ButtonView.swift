//
//  ButtonView.swift
//  Task11
//
//  Created by Егор Зайнуллин on 06.01.2022.
//

import UIKit

@IBDesignable
class ButtonView: UIView {
    
    @IBInspectable
    var width: CGFloat = 100
    
    @IBInspectable
    var radius: CGFloat = 70
    { didSet { updateRadius(radius) } }
    
    @IBInspectable
    var edgeColor: UIColor = .green
    { didSet { updateColor(edgeColor) } }
    
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
        
    }
    
    private let button = UIButton()
    
    private let delta = 1.0

    override func layoutSubviews() {
        let w = frame.size.width
        let h = 50.0
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
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
}
