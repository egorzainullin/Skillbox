//
//  ViewController.swift
//  Task4
//
//  Created by Егор Зайнуллин on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let model: ToDoModel = ToDoModel.createToDoModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        return cell
    }
    
    
}

