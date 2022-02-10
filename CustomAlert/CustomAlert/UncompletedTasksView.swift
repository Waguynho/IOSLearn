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
    
    @State private var completedTasksViewIsAppear: Bool = false
    
    
    // MARK: - View
    var body: some View {
        
        NavigationView () {
            
            VStack (spacing: 20){
                
                HStack (spacing: 5){
                    
                    Spacer()
                    
                    NavigationLink(destination: ChartContainer(filterType: "tag-priority")) {
                        Image(systemName: "chart.pie.fill")
                            .font(.title3)
                            .foregroundColor(.orange)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .font(.title3)
                            .foregroundColor(.green)
                    }
                }
                //.background(.green)
                .frame(height: 2)
                //.padding(.top, -25)
                .padding(.trailing, 10)
                
                List {
                    if !dataStore.completedTodoItems.isEmpty {
                        CompletedTasksSectionView(count: dataStore.completedTodoItems.count)
                            .onTapGesture {
                                completedTasksViewIsAppear = true
                            }
                    }
                    Section {
                        ForEach(dataStore.incompleteTodoItems) { todoItem in
                            ListCellView(todoItem: todoItem)
                        }
                        Spacer()
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarItems(
                    trailing: Button(
                        action: {
                            dataStore.currentAction = Action.actions.create
                            dataStore.alertShowing = true
                        },
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                        })
                )
                .navigationTitle("Waiting Tasks")
            }// vst
            //.background(.red)
            .padding(.all, 1)
        }
        .textFieldAlert(isPresented: $dataStore.alertShowing) {
            TextFieldAlert(action: dataStore.currentAction!)
        }
        .sheet(isPresented: $completedTasksViewIsAppear, content: {
            CompletedTasksView()
        })
    }
}

struct UncompletedTasksView_Previews: PreviewProvider {
    static var previews: some View {
        UncompletedTasksView()
    }
}
