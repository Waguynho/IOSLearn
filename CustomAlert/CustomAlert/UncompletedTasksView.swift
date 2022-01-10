//
//  ContentView.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.
//

import SwiftUI

struct UncompletedTasksView: View {
    
    // MARK: - Properties
    @ObservedObject var dataStore = DataStore.shared
    
    
    // MARK: - View
    var body: some View {
        NavigationView {
            List {
                if !dataStore.completedTodoItems.isEmpty {
                    CompletedTasksSectionView(count: dataStore.completedTodoItems.count)
                        .onTapGesture {
                            //completedTasksViewIsAppear = true
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UncompletedTasksView()
    }
}
