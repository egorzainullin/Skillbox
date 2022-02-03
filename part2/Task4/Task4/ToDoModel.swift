//
//  ToDoModel.swift
//  Task4
//
//  Created by Егор Зайнуллин on 02.02.2022.
//

import Foundation
import RealmSwift

class ToDoElement: Object {
    @Persisted var isDone: Bool
    
    @Persisted var isDeleted: Bool
    
    @Persisted var dateOfCreation: Date
    
    @Persisted var dateToDo: Date
    
    @Persisted var text: String
    
    
}

class ToDoModel {
    var elements: [ToDoElement] = []
    
    let realm = try! Realm()
    
    private static let model: ToDoModel = ToDoModel()
    
    static func createToDoModel() -> ToDoModel {
        return ToDoModel.model
    }
}
