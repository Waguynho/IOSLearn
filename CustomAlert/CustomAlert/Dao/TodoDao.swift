import DataBaseLayer

final class TodoDao : DaoBase<TodoItem> {
    
    public func getCompletedItems () -> [TodoItem] {
        
        let completeds =  self.readAll().filter {
            $0.completed == true
        }
       
      return completeds
    }
}


