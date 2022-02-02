

import Foundation
import DataBaseLayer

public struct TodoDataAcess {
    
    public let base: DataAccess<TodoItem>
    
    public  init(base: DataAccess<TodoItem> = .init()){
         
        self.base = base
    }
    
    public func getCompletedTasks() -> [TodoItem] {
        
        var newItem =  TodoItem(title: "Title 3", description: "ccc", priority: .normal, date: Date(), completed: true)
       
        base.save(newItem)
        
        do {
            try base.dbq.read { db in
               let items = try TodoItem.fetchAll(db)
               let x = 9
            }
        } catch  let error1 as NSError {
            print(error1)
        } catch {

        }
        
        return []
    }


    
}
