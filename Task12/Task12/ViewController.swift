//
//  ViewController.swift
//  Task12
//
//  Created by Егор Зайнуллин on 09.01.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private var characters: [Character] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    private var rowNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Loader.loadCharacters(completion: { characters in
            self.characters = characters
            self.tableView.reloadData()
            
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CharacterViewController {
            vc.character = characters[rowNumber]
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        let i = indexPath.row
        cell.nameLabel.text = characters[i].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowNumber = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



