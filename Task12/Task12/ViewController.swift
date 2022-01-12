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
    
    private var isAppeared = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (!isAppeared) {
        Loader.loadCharacters(completion: { characters in
            self.characters = characters
            self.tableView.reloadData()
        })
            isAppeared = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CharacterViewController {
            vc.character = characters[rowNumber]
            debugPrint("Prepare")
            print(rowNumber)
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
        cell.statusLabel.text = characters[i].status + " - " + characters[i].species
        cell.planetLabel.text = characters[i].origin.name
        cell.lastKnownLocationLabel.text = characters[i].location.name
        let url = URL(string: characters[i].image)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                cell.characterImageView.image = UIImage(data: data!)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        rowNumber = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "toCharacterSegue", sender: self)
    }
}



