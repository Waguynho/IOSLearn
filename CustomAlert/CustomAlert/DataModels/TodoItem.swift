
import DataBaseLayer
import SwiftUI

public struct TodoItem: DataEntityProtocol , Identifiable{
    
    public static var dataBaseTableName: String = "todo_item"
    
    public var id : Int64?
    public var title: String
    public var description: String?
    public var priority: Priority?
    public var date: Date
    public var completed = false
    
    public init(
        title: String,
        description: String? = "",
        priority: TodoItem.Priority? = .normal,
        date: Date = Date(),
        completed: Bool = false
    )
    {
        //self.id = id
        self.title = title
        self.description = description
        self.priority = priority
        self.date = date
        self.completed = completed
    }
    
    static var example: [TodoItem]  {
        
        // TodoDataAcess().getAllTasks()
        
        TodoDao().readAll()
        
    }
    
}

extension TodoItem  {
    
    public enum Priority: CaseIterable, Codable, CustomStringConvertible {
        case urgent
        case high
        case normal
        case low
        
        static let all = Priority.allCases
        
        public  var description : String {
            switch self {
            case .urgent: return "Urgente"
            case .high: return "High"
            case .low: return "Low"
            case .normal: return "Normal"
            }
        }
    }
}
