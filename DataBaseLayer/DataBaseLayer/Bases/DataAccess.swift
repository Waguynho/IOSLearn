
import Foundation
import GRDB


public class DataAccess<T: DataEntityProtocol>   {
    
    
    private  let  baseConnection:  BaseConnection
    public let  dbq : DatabaseQueue
    
    private let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
    public init(){
        
        baseConnection = BaseConnection(pathDb: "\(path)/ws/alert-db.sqlite3")
        
        dbq = baseConnection.connectDd()!
    }
    
    open func save(_ dataEntity: T) {
        
        do {
            
            try dbq.write{ db in
                
                try dataEntity.save(db)
                
            }
            
        } catch  let error1 as NSError {
            print(error1.localizedFailureReason)
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        } catch {
            
        }
    }
    
    public func readAll () -> [T]  {
        
        var result: [T] = []
        
        do {
            
            try  self.dbq.read { db in
                result = try T.fetchAll( db)
            }
            
        } catch  let error1 as NSError {
            print(error1)
        } catch {
            
        }
        
        return result
    }
}

