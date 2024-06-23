//
//  DetailView.swift
//  ToDoList
//
//  Created by Denilson Washuma on 18/06/2024.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var toDosVM:ToDoViewModel
    @State var toDo: ToDo
    
    var isNewToDo = false
    

    
    var body: some View {
       
            List{
                
                TextField("Enter title", text: $toDo.toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    //.padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder", isOn: $toDo.isReminderOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                if(toDo.isReminderOn){
                    DatePicker("Date", selection: $toDo.dueDate) .listRowSeparator(.hidden)
                        .padding(.bottom)
                }
                
                
                Text("Notes")
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                TextField("Enter a note", text: $toDo.note, axis: .vertical)
                    .font(.subheadline)
                    .textFieldStyle(.roundedBorder)
                    
                    .listRowSeparator(.hidden)
                
                Toggle("Is Completed", isOn: $toDo.isCompleted)
                    
                    .listRowSeparator(.hidden)

                
                
                
            }
            .listStyle(.plain)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(isNewToDo ?"Save" : "Update") {
                        
                        toDosVM.saveToDo(toDo: toDo, isNewToDo: isNewToDo)
                        dismiss()
                        
                    }
                    
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
     
        
    }
}


#Preview {
    NavigationStack {
        DetailView( toDo: ToDo())
            .environmentObject(ToDoViewModel())
    }
}
