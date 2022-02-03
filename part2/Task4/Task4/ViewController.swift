//
//  ViewController.swift
//  Task4
//
//  Created by Егор Зайнуллин on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var model: ToDoModel = ToDoModel.createToDoModel(delegate: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        model = ToDoModel.createToDoModel(delegate: self)
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getCurrentTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        return cell
    }
}

extension ViewController: ElementUpdatedDelegate {
    func elementUpdated(sender: ToDoElement) {
        
    }
    
    
}

