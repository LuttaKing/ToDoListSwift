//
//  ContentView.swift
//  ToDoList
//
//  Created by Denilson Washuma on 18/06/2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var toDosVM:ToDoViewModel
    @State private var sheetOn = false
    
    var body: some View {
        
        NavigationStack {
            List{
                //
                
                ForEach(toDosVM.toDos) { todo in
                    NavigationLink {
                        DetailView( toDo: todo)
                    } label: {
                        Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                            .foregroundColor(todo.isCompleted ? .blue : .gray)
                            .onTapGesture {
                                toDosVM.updateTodo(toDo: todo)
                            }
                        Text("\(todo.toDo)")
                        
                        
                    }
                    .font(.title2)
                    
                }
                .onDelete(perform: { indexSet in
                    toDosVM.deleteToDo(indexSet: indexSet)
                })
                
                
                
            }
            
            .navigationTitle("To Do List!")
            .listStyle(.plain)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        sheetOn.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    
                }
            }
            .sheet(isPresented: $sheetOn, content: {
                NavigationStack {
                    DetailView(toDo: ToDo(),isNewToDo: true)
                }
            })
        }
        
    }
}

#Preview {
    ToDoListView()
        .environmentObject(ToDoViewModel())
}

