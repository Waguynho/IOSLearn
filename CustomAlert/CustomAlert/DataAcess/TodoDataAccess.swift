

import Foundation
import DataBaseLayer

public struct TodoDataAcess {
    
    public let base: DataAccess<TodoItem>
    
    public  init(base: DataAccess<TodoItem> = .init()){
        
        self.base = base
    }
    
    //    public func getCompletedTasks() -> [TodoItem] {
    //
    //
    //        do {
    //            //let tasks =  base.readAll(<#T##dataEntity: TodoItem##TodoItem#>)
    //            let x = 0
    //        } catch  let error1 as NSError {
    //            print(error1)
    //        } catch {
    //
    //        }
    //
    //        return []
    //    }
    
    
    public func getAllTasks() -> [TodoItem] {
        
        let tasks = try base.readAll()
        return tasks
    }
    
    public func saveTask(dataEntity: TodoItem){
        
        // let newItem = TodoItem(title: "Title 4", description: "description 4", priority: .low, date: Date(), completed: false)
        
        self.base.save(dataEntity)
    }
    
    public func delete(dataEntity: TodoItem){
        self.base.delete(dataEntity)
    }
}
