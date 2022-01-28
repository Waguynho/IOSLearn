import SwiftUICharts
import SwiftUI

struct MultipleCharts: View {
    

    
    let chartStyle = ChartStyle(backgroundColor: Color.green, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white,legendTextColor: Color.yellow, dropShadowColor: .pink )

    var lines =  LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Frequency", legend: "Days")
    
    var body: some View {
        
        VStack {
            Spacer(minLength: 1)
            LineChartView(data: [8,23,54,32,12,37,7,23,43], title: "Frequency", legend: "Days")
            Spacer(minLength: 1)
            PieChartView(data: [8,23,54,32], title: "Issues", legend: "by product")
            Spacer(minLength: 1)
        }
        
        
            
    }
}

struct SampleChart_Previews: PreviewProvider {
    static var previews: some View {
        MultipleCharts()
    }
}
