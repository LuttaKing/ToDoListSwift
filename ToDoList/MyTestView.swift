//
//  MyTestView.swift
//  ToDoList
//
//  Created by Denilson Washuma on 22/06/2024.
//

import SwiftUI

struct ToDoItem{ // we tried here with Class it didnt work coz Class is a Reference Type
    var item:String = "test"
    var completed = false
}

struct MyTestView: View {
    
    @State private var toDo = ToDoItem()
    
    var body: some View {
        VStack {
            Text("Hello, \(toDo.item)")
            
         TextField("Enter a title", text: $toDo.item)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    MyTestView()
}
