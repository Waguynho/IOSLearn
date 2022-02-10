import Charts
import Foundation

struct ChartDataHelper {
    
    private let dao : TodoDao = TodoDao()
    var dataEntiresPriority : [PieChartDataEntry]
    var dataEntiresConclusion : [PieChartDataEntry]
    
    init() {
        
        dataEntiresPriority = [
            
            PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.urgent).count ), label: TodoItem.Priority.high.description),
            PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.high).count ), label: TodoItem.Priority.high.description),
            PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.normal).count ), label: TodoItem.Priority.normal.description),
            PieChartDataEntry(value: Double( dao.getItemsByPriority(priority: TodoItem.Priority.low).count ), label: TodoItem.Priority.low.description)
        ]
        
        dataEntiresConclusion = [
            
            PieChartDataEntry(value: Double( dao.getPendingItems().count ), label: "Todo"),
            PieChartDataEntry(value: Double(dao.getCompletedItems().count ), label: "Done")
        ]
        
    }
    
    public func getChartData(byPriority: Bool) -> [PieChartDataEntry]{
        if byPriority {
            return dataEntiresPriority
        }
        
        return dataEntiresConclusion
    }
    
}
