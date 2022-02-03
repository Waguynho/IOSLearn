
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
    
    public func delete (_ dataEntity: T) {
        
        do {
            
            try dbq.write { db in
                
                try dataEntity.delete(db)
            }
            
        } catch  let error1 as NSError {
            print("ERROR DELETE")
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        } catch {
            
        }
        
    }
    
    open func save(_ dataEntity: T) {
        
        do {
            
            try dbq.write{ db in
                
                try dataEntity.save(db)
                
            }
            
        } catch  let error1 as NSError {
            print("ERROR CREATE")
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        } catch {
            
        }
    }
    
    open func update(_ dataEntity: T) {
        
        do {
            
            try dbq.write{ db in
                
                try dataEntity.update(db)
            }
            
        } catch  let error1 as NSError {
            print("ERROR UPDATE")
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
            print("ERROR READ ALL")
            print(error1)
        } catch {
            
        }
        
        return result
    }
}

