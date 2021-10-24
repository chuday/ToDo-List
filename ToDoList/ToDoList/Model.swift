//
//  Model.swift
//  ToDoList
//
//  Created by Mikhail Chudaev on 23.10.2021.
//

import Foundation

    // MVC
// Model - model, View - TableViewController, Controller - Storyboard
// Логика работы приложения

// массив дел
var ToDoItems: [[String: Any]] {
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String : Any]] {
            return array
        } else {
            return []
        }
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
}

// добавить айтем
func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
}

// удалить айтем
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}

// меняем состояние выполнения дел по списку
func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    
    return ToDoItems[item]["isCompleted"] as! Bool
}
