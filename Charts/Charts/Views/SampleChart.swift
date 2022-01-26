import SwiftUICharts
import SwiftUI

struct SampleChart: View {
    
    @State var data = ChartData(values: [
            ("Janeiro",2200),
            ("Fevereiro",550),
            ("Março",3000),
            ("Abril",5400)
    ])
    
    var body: some View {
        
        BarChartView(
            data: data,
            title: "Balanço",
            legend: "Meses",
            style: Styles.barChartMidnightGreenLight,
            form: CGSize(width: 360, height: 600),
            dropShadow: true,
            animatedToBack: true
        )
    }
}

struct SampleChart_Previews: PreviewProvider {
    static var previews: some View {
        SampleChart()
    }
}
