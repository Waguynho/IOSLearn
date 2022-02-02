
import Foundation
import GRDB

public protocol DataEntity : Equatable, Codable, FetchableRecord, PersistableRecord  {
    static var dataBaseTableName: String { get }
    var id: Int64  { get }

    static func mirrorObject() -> Mirror
    
    
    
}

