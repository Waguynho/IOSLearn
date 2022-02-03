

import SwiftUI

class DataStore: ObservableObject {
 
    static let shared = DataStore()

    
    @Published var allTodoItems = TodoItem.example
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
    
    func uncomplete(_ todoDataStore: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoDataStore)].completed = false
    }
        
    func complete(_ todoDataStore: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoDataStore)].completed = true
    }
        
    func delete(_ deleteItem: TodoItem) {
        TodoDataAcess().delete(dataEntity: deleteItem)
        refresh()
    }
        
    func edit(_ previewsTodoItem: TodoItem, _ editTodoItem: inout TodoItem) {
        
       // let index: Int = getSelectedTodoItemIndex(selected: editTodoItem)
        editTodoItem.id = previewsTodoItem.id!
        
        TodoDataAcess().updateTask(dataEntity: editTodoItem)
        
        refresh()
    }
        
    func create(_ newItem: TodoItem) {
        TodoDataAcess().saveTask(dataEntity: newItem)
        refresh()
    }
    
    private func getSelectedTodoItemIndex(selected todoDataStore: TodoItem) -> Int {
        allTodoItems.firstIndex(where: { $0.id == todoDataStore.id })!
    }
    
    private func refresh(){
        
        DispatchQueue.main.async {
            var tasks = TodoItem.example
            self.allTodoItems = tasks
        }
    }
}

