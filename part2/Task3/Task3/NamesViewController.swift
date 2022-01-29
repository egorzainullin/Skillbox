//
//  NamesViewController.swift
//  Task3
//
//  Created by Егор Зайнуллин on 29.01.2022.
//

import UIKit
import Bond
import simd

class NamesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var names = MutableObservableArray(["Anton", "Nikita", "Alex", "Misha",
                                        "Tanya", "Yulya", "Pasha", "Sasha",
                                        "Dasha", "Vanya", "Vanya2", "Tony",
                                        "Peter", "Norman", "Kurt", "Richard",
                                        "Danya", "Sonya", "Ruslan", "Ruslan2"])
    
    @IBAction func addName(_ sender: Any) {
        names.insert("Random Name", at: 0)
    }
    
    @IBAction func deleteName(_ sender: Any) {
        names.remove(at: names.count - 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.reactive.text
            .throttle(for: 2)
            .combineLatest(with: names)
            // Хочется отфильтровать то, что строка начинается на textToSearch
            .filter {textToSearch, names -> Bool in
                return true
            }
            .map({$1})
            .bind(to: tableView) {(dataSource, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell") as! NameTableViewCell
            cell.nameLabel.text = dataSource[indexPath.row]
            return cell
        }
        // Do any additional setup after loading the view.
    }
}
