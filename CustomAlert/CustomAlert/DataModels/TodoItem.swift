
import DataBaseLayer
import Foundation

public struct TodoItem: DataEntity , Identifiable{
    
    public static let dataBaseTableName = "todo_item"
    
    public var id : Int64?
    public var title: String
    public var description: String?
    public var priority: Priority?
    public var date: Date
    public var completed = false
    
    public init(
        title: String,
        description: String? = nil,
        priority: TodoItem.Priority? = nil,
        date: Date,
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
    
    
//    public static func mirrorObject() -> Mirror {
//        let dummy = Self.fixture()
//        return .init(reflecting: dummy)
//    }
    
    
    static let example: [TodoItem] = [
        
        //        TodoItem(description: "Buy a new iPhone 12 Pro Max.", priority: .urgent, date: Date().daysAdded(5), completed: false, title: "Go to Apple Store!"),
        //        TodoItem(description: "At 12pm, I must drink a latte.", priority: .high, date: Date().daysAdded(3), completed: false, title: "Make some coffee. ☕️"),
        //        TodoItem(description: "Mail boxes", priority: .high, date: Date().daysAdded(-2), completed: true, title: "Look the mail boxes"),
        //        TodoItem(description: "I want to watch ", priority: .low, date: Date().daysAdded(-5), completed: true, title: "Watch documentary"),
        //        TodoItem(description: "I want to read B. Obama's new book.", priority: .normal, date: Date().daysAdded(1), completed: false, title: "Read book")
    ]
    
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
