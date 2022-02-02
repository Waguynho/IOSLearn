
import Foundation
import GRDB


public protocol EntityBase: Record, DataEntity {
    
    
}

public class DataAccess<T: DataEntity>   {
    
    
    private  let  baseConnection:  BaseConnection
    public let  dbq : DatabaseQueue
    
    private let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
    public init(){
        
        baseConnection = BaseConnection(pathDb: "\(path)/ws/db.sqlite3")
        
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
    
//    open func readAll (_ dataEntity: DataEntity){
//        do {
//
//            try dbq.read { db in
//               // let items = try dataEntity.fetchAll(db)
//            }
//
//        } catch  let error1 as NSError {
//            print(error1)
//        } catch {
//
//        }
//    }
}

