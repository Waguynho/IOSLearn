
import DataBaseLayer
import Foundation

public struct TodoItem: DataEntityProtocol , Identifiable{
    
    public static let dataBaseTableName = "todo_item"
    
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
    

    
    static let example: [TodoItem] = TodoDataAcess().getAllTasks()
        
            
        

    
    
}

extension TodoItem {
    
    public enum Priority: CaseIterable, Codable {
        case urgent
        case high
        case normal
        case low
        
        static let all = Priority.allCases
        
        
    }
    
    static func fixture(
        
        
        id: Int64 = 0,
        title: String = "",
        description: String? = nil,
        priority: TodoItem.Priority? = nil,
        date: Date = .init(),
        completed: Bool = false
        
        
    ) -> Self {
        .init( title: title, description: description, priority: priority, date: date, completed: completed)
    }
}
