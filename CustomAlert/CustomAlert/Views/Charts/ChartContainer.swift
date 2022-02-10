

import SwiftUI

struct ChartContainer: View {
    
     @State  var showConfig = false
     @State  var filterType: String = "tag-priority"
    
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
            PriorityChartConfig(filterType: $filterType, nameFilter: filterType)
        })
    }
}


