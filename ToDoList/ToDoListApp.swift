//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Denilson Washuma on 18/06/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var toDosVM = ToDoViewModel()
    // StateObject - creates first instance of an ObservableObject. (Use it only once per object
    //https://youtu.be/DBZh_I8sZxI?t=944
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
