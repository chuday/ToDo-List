//
//  Model.swift
//  ToDoList
//
//  Created by Mikhail Chudaev on 23.10.2021.
//

import Foundation
import UserNotifications
import UIKit

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
    setBadge()
}

// удалить айтем
func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
    setBadge()
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}

// меняем состояние выполнения дел по списку
func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    
    setBadge()
    return ToDoItems[item]["isCompleted"] as! Bool
}

// для обработки уведомлений на иконке
func requestForNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { (isEnabled, error) in
        if isEnabled {
            print("Согласие получено")
        } else {
            print("Отказ")
        }
    }
}

// метод установки бейджа
func setBadge() {
    var totalBadgeNumber = 0
    for item in ToDoItems {
        if (item["isCompleted"] as? Bool) == false {
            totalBadgeNumber = totalBadgeNumber + 1
        }
    }
    
    UIApplication.shared.applicationIconBadgeNumber = totalBadgeNumber
    
}
