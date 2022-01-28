import SwiftUICharts
import SwiftUI

struct SampleChart: View {
    
    @State var data = ChartData(values: [
            ("Janeiro",2200),
            ("Fevereiro",550),
            ("Março",3000),
            ("Abril",5400)
    ])
    
    let chartStyle = ChartStyle(backgroundColor: Color.green, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white,legendTextColor: Color.yellow, dropShadowColor: .pink )

    
    var body: some View {
        
        BarChartView(
            data: data,
            title: "Balanço",
            legend: "Meses",
            style: chartStyle,
            form: CGSize(width: 300, height: 550),
            animatedToBack: true
        )
    }
}

struct SampleChart_Previews: PreviewProvider {
    static var previews: some View {
        SampleChart()
    }
}
