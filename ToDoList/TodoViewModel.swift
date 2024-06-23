//  Created by Denilson Washuma on 22/06/2024.

import Foundation



//ViewModel is usually a class coz we want to Reference it
class ToDoViewModel: ObservableObject {
    
// ObservableObject says this class has properties that publish changes that can be observed and trigger ui redraw
    
   @Published var toDos: [ToDo] = [] //Published keyword announces changes and trigger UI redraw
    
    init(){
        loadDataFromDevice()
    }
    
    
    func saveToDo(toDo:ToDo, isNewToDo:Bool){
        if (isNewToDo){
            toDos.append(toDo)
        } else {
            //not new to do: update
            if let index = toDos.firstIndex(where: {$0.id == toDo.id }){
                toDos[index] = toDo
            }
            
        }
        saveToDevice()
    }
    
    func updateTodo(toDo:ToDo){
        if let index = toDos.firstIndex(where: {$0.id == toDo.id }){
            toDos[index].isCompleted.toggle()
        }
    saveToDevice()
        
    }
    
    func deleteToDo(indexSet: IndexSet){
        toDos.remove(atOffsets: indexSet)
        saveToDevice()
    }
    
    func saveToDevice(){
        //https://youtu.be/ddovzbDZS3g
        
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) //try? means if an error occurs, data = nil
        do{
            try data?.write(to: path)
        } catch{
            print("save error: \(error.localizedDescription)")
        }
    }
    
    
    func loadDataFromDevice(){
        
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do{
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch{
            print("load error: \(error.localizedDescription)")
        }
    }
    
    
    func purgeDataFromDevice(){
        //USE THIS TO CLEAR DATA FROM PReVIEW: add it to init()
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
        do{
            try data?.write(to: path)
        } catch{
            print("save error: \(error.localizedDescription)")
        }
    }
    
    
    
    
}

