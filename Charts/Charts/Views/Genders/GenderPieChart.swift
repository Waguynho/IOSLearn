import SwiftUICharts
import SwiftUI

struct GenderPieChart: View {
    
    private var gc: GenderController
    private var chartData: ChartData

    init() {
        self.gc = GenderController()
        self.chartData = gc.getDataBy(typeChart: .Amount)
    }
    var body: some View {
        
        PieChartView(data: [8,23,54,32,12,37,7,23,43], title: "Title", legend: "Legendary")
        
     
    }
}

struct GenderPieChart_Previews: PreviewProvider {
    static var previews: some View {
        GenderPieChart()
    }
}
