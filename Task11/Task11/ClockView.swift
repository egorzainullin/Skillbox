import UIKit

//@IBDesignable
class ClockView: UIView {
    var isSetuped = false
    
    var markerSize: CGFloat = 3
    var markerLength: CGFloat = 12
    var markerColor: UIColor = UIColor.blue
    
    var hourLineLength: CGFloat = 50
    @IBInspectable var hourLineSize: CGFloat = 6
    @IBInspectable var hourLineColor: UIColor = .green
    
    var minuteLineLength: CGFloat = 80
    @IBInspectable var minuteLineSize: CGFloat = 4
    @IBInspectable var minuteLineColor: UIColor = .blue
    
    
    var secondLineLength: CGFloat = 120
    @IBInspectable var secondLineSize: CGFloat = 1
    @IBInspectable var secondLineColor: UIColor = .purple
    
    
    @IBInspectable var roundedViewColor: UIColor = .black
    let centerRaduis = 8.0
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    
    private let centerView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = frame.size.width
        let h = frame.size.height
        
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLength, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor
        }
        
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: h / 2 - hourLineLength, width: hourLineSize, height: hourLineLength)
        hourLine.backgroundColor = hourLineColor
        
        minuteLine.frame = CGRect(x: w / 2, y: h / 2 - minuteLineSize / 2, width: minuteLineLength, height: minuteLineSize)
        minuteLine.backgroundColor = minuteLineColor
        
        secondLine.frame = CGRect(x: w / 2, y: h / 2, width: secondLineSize, height: secondLineLength)
        secondLine.backgroundColor = secondLineColor
        
        centerView.backgroundColor = roundedViewColor
        centerView.frame = CGRect(x: w / 2 - centerRaduis, y: h / 2 - centerRaduis, width: 2 * centerRaduis, height: 2 * centerRaduis)
        centerView.layer.cornerRadius = 8
        
        layer.cornerRadius = frame.size.width / 2
        
        if isSetuped { return }
        isSetuped = true

        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, minuteLine, secondLine, centerView]{
            addSubview(v)
        }
        
        
    }
    
    
}
