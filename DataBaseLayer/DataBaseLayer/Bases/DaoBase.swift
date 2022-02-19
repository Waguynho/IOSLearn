
import Foundation
import GRDB

open class DaoBase <T: DataEntityProtocol> {
    
    private var dbQueue :  DatabaseQueue = .init()
    
    private var basePath = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first! + "/ws/custom-alert"
    
   public init() {
       
       
       let baseConnection = BaseConnection(pathDb: "\(basePath)/alert-db.sqlite3")
       self.createFolderDataBase()
       self.dbQueue = baseConnection.connectDd()!
       
   }
    
    public func delete (_ dataEntity: T) {
        
        do {
            
            try dbQueue.write { db in
                
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
            
            try dbQueue.write{ db in
                
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
            
            try dbQueue.write{ db in
                
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
}

public extension DaoBase {
    
     func readAll () -> [T]  {
        
        var result: [T] = []
        
        do {
            
            try  self.dbQueue.read { db in
                result = try T.fetchAll( db)
            }
            
        } catch  let error1 as NSError {
            print(error1)
        } catch {
            
        }
        
        return result
    }
    
    private func createTables() -> Void {
        
        do {
            
            try dbQueue.write { db in
                try db.create(table: "TodoItem", temporary: false, ifNotExists: true) { t in
                    t.autoIncrementedPrimaryKey("id")
                    t.column("title", .text).unique()
                    t.column("description", .text)
                    t.column("priority", .any)
                    t.column("date", .date).notNull().defaults(to: Date())
                    t.column("completed", .boolean)
                }
            }
            
        }catch  let error1 as NSError {
            print(error1.localizedFailureReason as Any)
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        }catch {
            print("=== CREATE TABLE ERROR")
        }
    }
    
    private func connectDd(pathDb: String) -> DatabaseQueue {
        
        do {
            dbQueue = try DatabaseQueue(path: pathDb)
            
            createTables()
            
            return dbQueue
            
        }catch  let error1 as NSError {
            print(error1.localizedFailureReason)
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        } catch {
            print("=== CREATE CONNECTION")
            
        }
        return dbQueue
    }
    
    private func createFolderDataBase(){
        if !FileManager.default.fileExists(atPath: basePath) {
            do {
                try FileManager.default.createDirectory(atPath: basePath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
