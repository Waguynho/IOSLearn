

import SwiftUI

class DataStore: ObservableObject {
 
    static let shared = DataStore()
    
    @Published var  allTodoItems = TodoItem.example
    @Published var currentAction: Action? = nil
    @State var menuActions: [Action] = []
    @Published var alertShowing = false
    
    
    var incompleteTodoItems: [TodoItem] {
        return allTodoItems.filter { todoDataStore in
            !todoDataStore.completed
        }
    }
    var completedTodoItems: [TodoItem] {
        return allTodoItems.filter { todoDataStore in
            todoDataStore.completed
        }
    }  
    
    func getMenuItems(selected todoDataStore: TodoItem) -> some View {
        var actions: [Action] {
            if todoDataStore.completed {
                return [Action.actions.uncomplete, Action.actions.delete, Action.actions.edit]
            } else {
                return [Action.actions.complete, Action.actions.delete, Action.actions.edit]
            }
        }
            
        return ForEach(actions) { action in
            Button(action: { [self] in
                currentAction = action
                currentAction!.todoItem = todoDataStore
                alertShowing = true
            }) {
                Text(action.menuItemTitle!)
            }
        }
    }
    
    func uncomplete(_ item: inout TodoItem) {
        item.completed = false
        updateItem(item)
    }
    
        
    func complete( _ item: inout TodoItem) {
        item.completed = true
        updateItem(item)
    }
        
    func delete(_ deleteItem: TodoItem) {
        
        TodoDao().delete(deleteItem)
        refresh()
    }
        
    func edit(_ previewsTodoItem: TodoItem, _ editTodoItem: inout TodoItem) {
        
        editTodoItem.id = previewsTodoItem.id!
        
        updateItem(editTodoItem)
    }
        
    func create(_ newItem: TodoItem) {
        
        TodoDao().save(newItem)
        refresh()
    }
    
    private func updateItem(_ item: TodoItem){
        TodoDao().update(item)
        refresh()
    }
    
    private func getSelectedTodoItemIndex(selected todoDataStore: TodoItem) -> Int {
        allTodoItems.firstIndex(where: { $0.id == todoDataStore.id })!
    }
    
    private func refresh(){
        
        DispatchQueue.main.async {

            let xxxxx = TodoItem.example
            self.allTodoItems = xxxxx

        }
    }
}

