//
//  ToDo.swift
//  ToDoList
//
//  Created by Denilson Washuma on 22/06/2024.
//

import Foundation

struct ToDo: Identifiable, Codable {
    // identifiable is to create the Unique id; incase we need e.g in forEach
    // Codable to allow to save to device
    var id = UUID().uuidString
    
     var toDo = ""
     var isReminderOn = false
     var dueDate = Date.now + (60*60*60)
     var note = ""
     var isCompleted = false
    
}
