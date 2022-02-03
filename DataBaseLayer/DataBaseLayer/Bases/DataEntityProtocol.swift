
import Foundation
import GRDB

public protocol DataEntityProtocol : Equatable, Codable, FetchableRecord, PersistableRecord  {
    
    static var dataBaseTableName: String { get set }
    
    var id: Int64?  { get set }
}

public extension DataEntityProtocol {
    
     func doIt () -> Void {
         print("bla bla bla")
    }
    
   
}

