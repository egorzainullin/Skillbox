//
//  ToDoViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 15.01.2022.
//

import UIKit
import RealmSwift

class ToDoElement: Object {
    @objc dynamic var toDo: String = ""
    
    static func createToDoElement(toDo: String) -> ToDoElement {
        let element = ToDoElement()
        element.toDo = toDo
        return element
    }
}

class ToDoViewController: UIViewController {
    
    var toDoArray: [ToDoElement]
    {
        get { getArrayFromRealm() }
    }
    
    private func getArrayFromRealm() -> [ToDoElement] {
        return Array(realm.objects(ToDoElement.self))
    }
    
    private let realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addTaskTouchUpInside(_ sender: Any) {
        try! realm.write {
            let element = ToDoElement.createToDoElement(toDo: textField.text ?? "")
            realm.add(element)
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ToDoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath)
        if let cell = cell as? ToDoTableViewCell {
            cell.text = toDoArray[indexPath.row].toDo
            cell.delegate = self
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("Cell was selected")
        tableView.deselectRow(at: indexPath, animated: true)
        }
}

extension ToDoViewController: ToDoViewCellProtocol {
    func isTrashButtonClicked(_ sender: ToDoTableViewCell) {
        let filtered = realm.objects(ToDoElement.self).filter({ element in
            element.toDo == sender.text
        })
        try! realm.write {
            realm.delete(filtered)
        }
        self.tableView.reloadData()
    }
}
    
    

