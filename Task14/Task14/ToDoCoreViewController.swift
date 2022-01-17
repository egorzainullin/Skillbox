//
//  ToDoCoreViewController.swift
//  Task14
//
//  Created by Егор Зайнуллин on 17.01.2022.
//

import UIKit
import CoreData

class ToDoCoreViewController: UIViewController {

    var toDoElements: [NSManagedObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addTaskTouchUpInside(_ sender: Any) {
        if let text = textField.text {
            save(toDoText: text)
            tableView.reloadData()
        }
    }
    
    func save(toDoText: String) {
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "ToDoCoreElement",
                                   in: managedContext)!
        let toDoElement = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        toDoElement.setValue(toDoText, forKeyPath: "toDoText")
            do {
                try managedContext.save()
                toDoElements.append(toDoElement)
                
            } catch let error as NSError {
        debugPrint("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    func getElements() {
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext =
          appDelegate.persistentContainer.viewContext
        let fetchRequest =
          NSFetchRequest<NSManagedObject>(entityName: "ToDoCoreElement")
        
        do {
            toDoElements = try managedContext.fetch(fetchRequest)
        }
          catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func delete(toDoText: String) {
        guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<ToDoCoreElement> = ToDoCoreElement.fetchRequest()
        request.predicate = NSPredicate(format: "toDoText==%@", toDoText)
        if let result = try? managedContext.fetch(request) {
            for element in result {
                managedContext.delete(element)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
     
    }
}

extension ToDoCoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath)
        if let cell = cell as? ToDoTableViewCell {
            cell.text = toDoElements[indexPath.row].value(forKey: "toDoText") as! String
            cell.delegate = self
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("Cell was selected")
        tableView.deselectRow(at: indexPath, animated: true)
        }
}


extension ToDoCoreViewController: ToDoViewCellProtocol {
    func isTrashButtonClicked(_ sender: ToDoTableViewCell) {
        delete(toDoText: sender.text)
        getElements()
        self.tableView.reloadData()
    }
}
