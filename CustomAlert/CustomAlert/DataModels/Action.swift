//
//  Action.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.
//

import Foundation

struct Action: Identifiable {
    
    
    
    var id = UUID()
    var todoItem: TodoItem?
    let actionType: ActionType
    let menuItemTitle: String?
    let alertTitle: String?
    let alertDescription: String?
    
    enum ActionType: String {
        
        case uncomplete = "Uncomplete item"
        case complete = "Complete item"
        case delete = "Delete item"
        case edit = "Edit item"
        case create = "Create a new item"
        
    }
    
    static let actions: (uncomplete: Action, complete: Action, delete: Action, edit: Action, create: Action) = (
        uncomplete:
            Action(actionType: .uncomplete, menuItemTitle: "Uncomplete", alertTitle: ActionType.uncomplete.rawValue, alertDescription: nil),
        complete:
            Action(actionType: .complete, menuItemTitle: "Complete", alertTitle: ActionType.complete.rawValue, alertDescription: nil),
        delete:
            Action(actionType: .delete, menuItemTitle: "Delete", alertTitle: ActionType.delete.rawValue, alertDescription: "After you delete this item, you won't be able to access this item again."),
        edit:
            Action(actionType: .edit, menuItemTitle: "Edit", alertTitle: ActionType.edit.rawValue, alertDescription: "After making changes to this item, ou cannot undo these changes."),
        create:
            Action(actionType: .create, menuItemTitle: nil, alertTitle: ActionType.create.rawValue, alertDescription: nil)
    )
    
}
