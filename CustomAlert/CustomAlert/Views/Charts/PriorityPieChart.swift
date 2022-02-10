import Charts
import SwiftUI

struct PriorityPieChart: UIViewRepresentable {
    
    let dataHelper: ChartDataHelper = .init()
    
    
    func makeUIView(context: Context) -> PieChartView {
        return PieChartView()
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        
        var dataEntires : [PieChartDataEntry] = dataHelper.getChartData(byPriority: false)
      
        let dataSet = PieChartDataSet(entries: dataEntires, label: "Tasks")
        
        uiView.data = PieChartData(dataSet: dataSet)
        
        formatDataSet(dataSet: dataSet)
        
        
        uiView.holeColor = .green
        
    }
    
    func formatDataSet(dataSet:PieChartDataSet){
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .none
        
        dataSet.entryLabelFont = .boldSystemFont(ofSize: 18)
        dataSet.entryLabelColor = .systemGray
        dataSet.valueFormatter =  DefaultValueFormatter(formatter: formatter)
       
        dataSet.colors = [.red, .brown,  .purple, .black]
    }
}

struct TodoPieChart_Previews: PreviewProvider {
    static var previews: some View {
        PriorityPieChart()
    }
}
