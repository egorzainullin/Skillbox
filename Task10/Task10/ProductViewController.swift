//
//  ProductViewController.swift
//  Task10
//
//  Created by Егор Зайнуллин on 01.01.2022.
//

import UIKit

class ProductViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    struct Product {
        var name: String
        var cost: Double
        var sale: Double
        var image: String
        init(name: String, cost: Double, sale: Double, image: String) {
            self.name = name
            self.cost = cost
            self.sale = sale
            self.image = image
        }
    }
    
var names = ["Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey"]
    
}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width / 3
        let height = width * 2
        return CGSize(width: width, height: height)
    }

}
