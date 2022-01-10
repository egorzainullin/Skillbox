//
//  ViewController.swift
//  Task12
//
//  Created by Егор Зайнуллин on 09.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var characters: [Character] = [
        Character(name:"Rick Sanchez", imageSource: "moon")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell
        
        return cell
    }
}



