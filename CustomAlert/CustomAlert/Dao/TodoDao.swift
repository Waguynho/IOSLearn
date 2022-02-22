import DataBaseLayer

open class TodoDao : DaoBase<TodoItem> {
    
    public func getCompletedItems() -> [TodoItem] {
        
        let completeds =  self.readAll().filter {
            $0.completed == true
        }
       
      return completeds
    }
    
    public func getPendingItems() -> [TodoItem] {
        
        let uncompleteds =  self.readAll().filter {
            $0.completed == false
        }
       
      return uncompleteds
    }
    
    public func getItemsByPriority(priority: TodoItem.Priority) -> [TodoItem] {
        
        let items =  self.readAll().filter {
            $0.priority == priority
        }
       
      return items
    }
}


