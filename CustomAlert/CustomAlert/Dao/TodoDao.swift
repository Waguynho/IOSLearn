import DataBaseLayer

final class TodoDao : DaoBase<TodoItem> {
    
    public func getCompletedItems () -> [TodoItem] {
        
        var completeds =  self.readAllXXX().filter {
            $0.completed == true
        }
       
      return completeds
    }
}


