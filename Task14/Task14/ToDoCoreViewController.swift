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
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
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
}

extension ToDoCoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath)
        if let cell = cell as? ToDoTableViewCell {
//            cell.text = toDoElements[indexPath.row].toDo
//            cell.delegate = self
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("Cell was selected")
        tableView.deselectRow(at: indexPath, animated: true)
        }
}
