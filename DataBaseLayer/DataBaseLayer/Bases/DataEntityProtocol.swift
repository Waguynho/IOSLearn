
import Foundation
import GRDB

public protocol DataEntityProtocol : Equatable, Codable, FetchableRecord, PersistableRecord  {
    
    static var dataBaseTableName: String { get set }
    
   
}

public extension DataEntityProtocol {
    
    var id: Int64?  {
        get{
            return self.getId()
        } set {
            
        }}
    
     func doIt () -> Void {
         print("bla bla bla")
    }
    
    private func getId() ->  Int64? {
        return id
    }
}

