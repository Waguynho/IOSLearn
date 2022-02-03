

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
        
        self.base.save(TodoItem(title: "Title 3", description: "description 3", priority: .urgent, date: Date(), completed: false))
        
        let tasks = try base.readAll()
        return tasks
    }
    
    
    
}
