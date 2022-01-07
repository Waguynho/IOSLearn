//
//  DataStore.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.
//

import Foundation

import SwiftUI

class DataStore: ObservableObject {
 
    static let shared = DataStore()
    
    @Published var allTodoItems = TodoItem.example
    @Published var currentAction: Action? = nil
    @State var menuActions: [Action] = []
    @Published var alertShowing = false
    
    var incompleteTodoItems: [TodoItem] {
        return allTodoItems.filter { todoItem in
            !todoItem.completed
        }
    }
    var completedTodoItems: [TodoItem] {
        return allTodoItems.filter { todoItem in
            todoItem.completed
        }
    }
    
    private func getSelectedTodoItemIndex(selected todoItem: TodoItem) -> Int {
        allTodoItems.firstIndex(where: { $0.id == todoItem.id })!
    }
    
    func getMenuItems(selected todoItem: TodoItem) -> some View {
        var actions: [Action] {
            if todoItem.completed {
                return [Action.actions.uncomplete, Action.actions.delete, Action.actions.edit]
            } else {
                return [Action.actions.complete, Action.actions.delete, Action.actions.edit]
            }
        }
            
        return ForEach(actions) { action in
            Button(action: { [self] in
                currentAction = action
                currentAction!.todoItem = todoItem
                alertShowing = true
            }) {
                Text(action.menuItemTitle!)
            }
        }
    }
    
    func uncomplete(_ todoItem: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoItem)].completed = false
    }
        
    func complete(_ todoItem: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoItem)].completed = true
    }
        
    func delete(_ todoItem: TodoItem) {
        allTodoItems.remove(at: getSelectedTodoItemIndex(selected: todoItem))
    }
        
    func edit(_ todoItem: TodoItem, newTodoItem: TodoItem) {
        allTodoItems[getSelectedTodoItemIndex(selected: todoItem)] = newTodoItem
    }
        
    func create(_ todoItem: TodoItem) {
        allTodoItems.insert(todoItem, at: 0)
    }
}

