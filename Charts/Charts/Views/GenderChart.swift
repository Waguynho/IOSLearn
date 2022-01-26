import SwiftUICharts
import SwiftUI

struct GenderChart: View {
    
    private let dao = PersonDao()
    @State var data: ChartData
    
    init() {
        
        data = ChartData( values:
            [
                ("Female",dao.countBy(.female)),
                ("Male",dao.countBy(.male))
            ]
        )
    }
    
    
    

    
    var body: some View {
        
        BarChartView(
            data: data,
            title: "Gender",
            legend: "Count",
            style: Styles.barChartStyleOrangeDark,
            form: CGSize(width: 300, height: 550),
            dropShadow: true,
            animatedToBack: true
        )
    }
}

struct GenderChart_Previews: PreviewProvider {
    static var previews: some View {
        GenderChart()
    }
}
