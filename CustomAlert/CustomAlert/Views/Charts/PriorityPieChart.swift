import Charts
import SwiftUI

struct PriorityPieChart: UIViewRepresentable {
    
    private let dao : TodoDao = TodoDao()
    
    func makeUIView(context: Context) -> PieChartView {
        return PieChartView()
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        
        var dataEntires : [PieChartDataEntry] = .init()
        
        dataEntires.append(PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.urgent).count ), label: TodoItem.Priority.high.description))
        dataEntires.append(PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.high).count ), label: TodoItem.Priority.high.description))
        dataEntires.append(PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.normal).count ), label: TodoItem.Priority.normal.description))
        dataEntires.append(PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.low).count ), label: TodoItem.Priority.normal.description))
        
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
        dataSet.label
        dataSet.colors = [.red, .brown,  .purple, .black]
    }
}

struct TodoPieChart_Previews: PreviewProvider {
    static var previews: some View {
        PriorityPieChart()
    }
}
