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
var ToDoItems: [[String: Any]] = [
                                ["Name": "Сделать звонок","isCompleted": false],
                                ["Name": "Запилить аппку", "isCompleted": false],
                                ["Name": "Залить на git", "isCompleted": false]
                                ]

// добавить айтем
func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
    saveData()
}

// удалить айтем
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    saveData()
}

// меняем состояние выполнения дел по списку
func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    saveData()
    
    return ToDoItems[item]["isCompleted"] as! Bool
}

// при вненсении изменений будем сохранять данные
func saveData() {
    
}

// при запуске будем загружать данные
func loadData() {
    
}
