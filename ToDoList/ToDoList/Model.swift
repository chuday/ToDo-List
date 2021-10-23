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


var ToDoItems: [String] = ["Сделать звонок", "Запилить аппку"]

// добавить айтем
func addItem(nameItem: String) {
    ToDoItems.append(nameItem)
    saveData()
}

// удалить айтем
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    saveData()
}

// при вненсении изменений будем сохранять данные
func saveData() {
    
}

// при запуске будем загружать данные
func loadData() {
    
}
