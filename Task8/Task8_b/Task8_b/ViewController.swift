//
//  ViewController.swift
//  Task8_b
//
//  Created by Егор Зайнуллин on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    struct CollectionElement {
        let imageName: String
        let oldCost: Double
        let newCost: Double
        let saleOff: Double
        let description: String
    }
    
    func drawBlock(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, element: CollectionElement) {
        let rect = CGRect(x: x, y: y, width: width, height: height)
        let view = UIView(frame: rect)
        let image = UIImage(named: element.imageName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x:0, y:0, width: width, height: height - 50)
        view.addSubview(imageView)
        let oldCostLabel = UILabel(frame: CGRect(x:0, y:height - 50, width: width - 20, height:10))
        oldCostLabel.text = "\(element.oldCost) руб"
        oldCostLabel.font = oldCostLabel.font.withSize(10)
        view.addSubview(oldCostLabel)
        let newCostLabel = UILabel(frame: CGRect(x:0, y: height - 40, width: width - 20, height: 10))
        newCostLabel.text = "\(element.newCost) руб"
        newCostLabel.font = newCostLabel.font.withSize(10)
        view.addSubview(newCostLabel)
        let descriptionLabel = UILabel(frame: CGRect(x:0, y: height - 30, width: width - 20, height: 30))
        descriptionLabel.text = element.description
        descriptionLabel.font = descriptionLabel.font.withSize(30)
        view.addSubview(descriptionLabel)
        let saleLabel = UILabel(frame: CGRect(x:width - 20, y:height - 50, width: 20, height: 20))
        saleLabel.text = "\(element.saleOff)%"
        saleLabel.backgroundColor = .red
        saleLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(saleLabel)
        self.view.addSubview(view)
    }
    
    func drawCollection(width: CGFloat, height: CGFloat, toBoundX: CGFloat, toBoundY: CGFloat, between: CGFloat, collection: [CollectionElement]) {
        for (i, element) in collection.enumerated() {
            let rowNumber = i / 2
            let columnNumber = i % 2
            if columnNumber == 0 {
               let x = toBoundX
               let y = toBoundY + CGFloat(rowNumber) * (height + between)
               drawBlock(x: x, y: y, width: width, height: height, element: element)
            }
            else {
                let x = toBoundX + width + between
                let y = toBoundY + CGFloat(rowNumber) * (height + between)
                drawBlock(x: x, y: y, width: width, height: height, element: element)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let element1 = CollectionElement(imageName: "cat1", oldCost: 10, newCost: 100, saleOff: 10, description: "cat 1")
        let element2 = CollectionElement(imageName: "cat2", oldCost: 20, newCost: 200, saleOff: 20, description: "cat 2")
        let element3 = CollectionElement(imageName: "cat3", oldCost: 30, newCost: 300, saleOff: 30, description: "cat 3")
        let element4 = CollectionElement(imageName: "cat4", oldCost: 40, newCost: 400, saleOff: 40, description: "cat 4")
        let collection = [element1, element2, element3, element4]
        let screenWidth = self.view.frame.width
        let toBoundX = CGFloat(20)
        let toBoundY = CGFloat(100)
        let between = CGFloat(10)
        let width = (screenWidth - 2 * toBoundX - between) / 2
        let height = width
        drawCollection(width: width, height: height, toBoundX: toBoundX, toBoundY: toBoundY, between: between, collection: collection)
    }


}

