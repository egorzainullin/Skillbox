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
    { didSet {delegate?.elementUpdated(sender: self)} }
    
    @Persisted var isDeleted: Bool
    { didSet {delegate?.elementUpdated(sender: self)} }
    
    @Persisted var dateOfCreation: Date
    { didSet {delegate?.elementUpdated(sender: self)} }
    
    @Persisted var dateToDo: Date
    { didSet {delegate?.elementUpdated(sender: self)} }
    
    @Persisted var text: String
    { didSet {delegate?.elementUpdated(sender: self)} }
    
    var delegate: ElementUpdatedDelegate?
}

protocol ElementUpdatedDelegate {
    func elementUpdated(sender: ToDoElement)
}

class ToDoModel {
    private var elements: [ToDoElement] = []
    
    private let realm = try! Realm()
    
    private var delegate: ElementUpdatedDelegate?
    
    static func createToDoModel(delegate: ElementUpdatedDelegate?) -> ToDoModel {
        let model = ToDoModel()
        model.elements = model.realm.objects(ToDoElement.self).map({$0})
        model.delegate = delegate
        for element in model.elements {
            element.delegate = delegate
        }
        return model
    }
    
    public func getCurrentTasks() -> [ToDoElement] {
        return elements.filter({element in !element.isDeleted && !element.isDone})
    }
    
    public func getDoneAndDeletedTasks() -> [ToDoElement] {
        return elements.filter({element in element.isDeleted || element.isDone})
    }
    
    public func addTask(element: ToDoElement) {
        try! realm.write({
            realm.add(element)
            elements.append(element)
            element.delegate = delegate
            element.delegate?.elementUpdated(sender: element)
        })
    }
}
