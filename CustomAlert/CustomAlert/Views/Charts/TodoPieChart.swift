import Charts
import SwiftUI

struct TodoPieChart: UIViewRepresentable {
    
    func makeUIView(context: Context) -> PieChartView {
        return PieChartView()
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        _ = TodoDao().readAll()
        var dataEntires : [PieChartDataEntry] = .init()
        dataEntires.append(PieChartDataEntry(value: 99, label: "Male"))
        dataEntires.append(PieChartDataEntry(value: 80, label: "Female"))
        dataEntires.append(PieChartDataEntry(value: 23, label: "Unknow"))
        
        let dataSet = PieChartDataSet(entries: dataEntires)
        
        uiView.data = PieChartData(dataSet: dataSet)
        
        formatDataSet(dataSet: dataSet)
        
        let DESCRIPTION  = uiView.chartDescription
        
        uiView.holeColor = .green
        
    }
    
    func formatDataSet(dataSet:PieChartDataSet){
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .none
        
        dataSet.valueFormatter =  DefaultValueFormatter(formatter: formatter)
        
        dataSet.colors = [.red, .purple, .black]
    }
    
    func formatLeftAxis (yAxis: YAxis){
        yAxis.labelTextColor =  .purple
    }
    
    func formatAxis(axis:XAxis){
        axis.valueFormatter = IndexAxisValueFormatter(values: ["Male","Female","Unknow"])
        axis.labelPosition = .topInside
    }
    
    

}

struct TodoPieChart_Previews: PreviewProvider {
    static var previews: some View {
        TodoPieChart()
    }
}
