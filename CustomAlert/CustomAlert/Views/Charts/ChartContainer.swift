//
//  ChartContainer.swift
//  CustomAlert
//
//  Created by Wagner Santos on 09/02/22.
//

import SwiftUI

struct ChartContainer: View {
    
     @State  var showConfig = false
     @State  var filterType: String = "tag-flag"
    
    var body: some View {
        VStack {
            PriorityPieChart()
            Button(action: {
                showConfig.toggle()
            }, label: {
                Text("Configure")
                Image(systemName: "gearshape")
                    .font(.largeTitle)
            })
        }.sheet(isPresented: $showConfig,   content: {
            PriorityChartConfig(filterType: $filterType, nameFilter: "")
        })
    }
}

struct ChartContainer_Previews: PreviewProvider {
    
    static var previews: some View {
        ChartContainer(filterType: "tag-pie")
    }
}
