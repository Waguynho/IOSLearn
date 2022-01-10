
import SwiftUI

struct CompletedTasksView: View {
    
    // MARK: - Properties
    @ObservedObject var dataStore = DataStore.shared
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - View
    var body: some View {
        NavigationView {
            List {
                ForEach(dataStore.completedTodoItems) { todoItem in
                    ListCellView(todoItem: todoItem)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Completed Tasks")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            })
            .textFieldAlert(isPresented: $dataStore.alertShowing) {
                TextFieldAlert(action: dataStore.currentAction!)
            }
        }
    }
}
