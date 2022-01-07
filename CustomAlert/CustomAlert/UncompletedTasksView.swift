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
    var body: some View {
        Text("Hello, Wagner dos Santos!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UncompletedTasksView()
    }
}
