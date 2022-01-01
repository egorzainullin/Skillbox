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
    
var names = ["Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey", "Nikita", "Anton", "Andrey"]
    

}

extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        cell.nameLabel.text = "1"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.size.width / 2
        return CGSize(width: w, height: w)
    }

}
