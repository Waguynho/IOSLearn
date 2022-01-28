import SwiftUICharts
import SwiftUI

struct GenderChart: View {
    
    private var gc: GenderController
    
    @State var showConfig = false
    @State private var isPercentageChart: Bool = false
    @State private var isDarkMode: Bool = false
    
    init() {
        self.gc = GenderController()
    }
    
    var body: some View {
        
        VStack {
            BarChartView(
                data: self.isPercentageChart ? gc.getDataBy(typeChart: .Percentage) : gc.getDataBy(typeChart: .Amount),
                title: "Gender",
                legend: "Count",
                style: isDarkMode ? Styles.barChartStyleOrangeDark : Styles.barChartStyleNeonBlueLight,
                form: CGSize(width: 300, height: 500),
                dropShadow: true,
                animatedToBack: true
            )
            Button(action: {
                showConfig.toggle()
            }, label: {
                Text("Configure")
                Image(systemName: "gearshape")
                    .font(.largeTitle)
            })
           .sheet(isPresented: $showConfig,   content: {
               GenderConfig(enablePercentage: $isPercentageChart, enableDarkMode: $isDarkMode)
           })
        }
    }
}

struct GenderChart_Previews: PreviewProvider {
    static var previews: some View {
        GenderChart()
    }
}
