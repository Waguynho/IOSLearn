import SwiftUI
import Combine

class TextFieldAlertViewController: UIViewController {

    // MARK: - UI Elements
    lazy var alertController = UIAlertController(title: action.alertTitle, message: action.alertDescription, preferredStyle: .alert)
    lazy var pickerView = UIPickerView()
    
    // MARK: - Properties
    private let action: Action
    private var isPresented: Binding<Bool>?
    let pickerViewComponents = TodoItem.Priority.allCases

    private var subscription: AnyCancellable?
    
    // MARK: - Life Cycle
    init(action: Action, isPresented: Binding<Bool>?) {
        self.action = action
        self.isPresented = isPresented
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Methods
    @objc func cancelAction() {
        alertController.textFields![3].resignFirstResponder()
    }

    @objc func doneAction() {
        if let datePickerView = alertController.textFields![3].inputView as? UIDatePicker {
            alertController.textFields![3].text = Date().dateString(date: datePickerView.date)
            alertController.textFields![3].resignFirstResponder()
        }
    }
    
    private func presentAlertController() {
            guard subscription == nil else { return }
            
            if action.actionType == .edit || action.actionType == .create {
                alertController.addTextField()
                alertController.addTextField()
                alertController.addTextField()
                alertController.addTextField()
                alertController.textFields![0].placeholder = "Title"
                alertController.textFields![1].placeholder = "Description"
                alertController.textFields![2].placeholder = "Priority"
                alertController.textFields![2].inputView = pickerView
                alertController.textFields![3].placeholder = "Date"
                alertController.textFields![3].datePicker(target: self, date: action.todoItem?.date ?? Date(), doneAction: #selector(doneAction), cancelAction: #selector(cancelAction))
            }
            
            if action.actionType == .edit {
                alertController.textFields![0].text = action.todoItem?.title
                alertController.textFields![1].text = action.todoItem?.description
                alertController.textFields![2].text = action.todoItem?.priority?.rawValue.name
                alertController.textFields![3].text = Date().dateString(date: action.todoItem!.date)
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { [weak self] _ in
                self?.isPresented?.wrappedValue = false
            }
            let completeAction = UIAlertAction(title: "Complete", style: .default) { [self] _ in
                withAnimation {
                    DataStore.shared.complete(action.todoItem!)
                }
            }
            let uncompleteAction = UIAlertAction(title: "Uncomplete", style: .default) { [self] _ in
                withAnimation {
                    DataStore.shared.uncomplete(action.todoItem!)
                }
            }
            let deleteAction = UIAlertAction(title: "Delete", style: .default) { [self] _ in
                withAnimation {
                    DataStore.shared.delete(action.todoItem!)
                }
            }
            let editAction = UIAlertAction(title: "Edit", style: .default) { [self] _ in
                let priority = TodoItem.Priority.allCases.filter { $0.rawValue.name == alertController.textFields![2].text }
                if let title = alertController.textFields![0].text,
                   let description = alertController.textFields![1].text,
                   let datePicker = alertController.textFields![3].inputView as? UIDatePicker {
                    let newTodoItem = TodoItem(title: title, description: description, priority: priority[0], date: datePicker.date)
                    DataStore.shared.edit(action.todoItem!, newTodoItem: newTodoItem)
                }
            }
            let createAction = UIAlertAction(title: "Create", style: .default) { [self] _ in
                if let title = alertController.textFields![0].text,
                   let description = alertController.textFields![1].text,
                   let priorityText = alertController.textFields![2].text,
                   let datePicker = alertController.textFields![3].inputView as? UIDatePicker {
                    let priority = TodoItem.Priority.allCases.filter({ $0.rawValue.name == priorityText })
                    let newTodoItem = TodoItem(title: title, description: description, priority: priority.isEmpty ? nil : priority[0], date: datePicker.date)
                    DataStore.shared.create(newTodoItem)
                }
            }
            
            alertController.addAction(cancelAction)
            if action.actionType == .complete {
                alertController.addAction(completeAction)
            } else if action.actionType == .uncomplete {
                alertController.addAction(uncompleteAction)
            } else if action.actionType == .delete {
                alertController.addAction(deleteAction)
            } else if action.actionType == .edit {
                alertController.addAction(editAction)
            } else if action.actionType == .create {
                alertController.addAction(createAction)
            }

            DataStore.shared.alertShowing = false
            present(alertController, animated: true, completion: nil)
        }
}
