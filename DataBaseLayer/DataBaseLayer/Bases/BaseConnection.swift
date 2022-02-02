import GRDB
import Foundation
import SwiftUI

public class BaseConnection {
    
    private var  dbQueue:  DatabaseQueue?
    private let pathDb: String
    
    init(pathDb: String){
        
        self.pathDb = pathDb
    }
    
    fileprivate func getConfiguration() -> Configuration {
        
        var config = Configuration()
        config.label = "WsDb"
        config.acceptsDoubleQuotedStringLiterals = false
        
        return config
    }
    
    public  func connectDd() -> DatabaseQueue? {
        
        do {
            //self.dbQueue = try DatabaseQueue(path: pathDb, configuration: getConfiguration())
            self.dbQueue = try DatabaseQueue(path: pathDb)
            
            createTables()
            
            return dbQueue!
            
        }catch  let error1 as NSError {
            print(error1.localizedFailureReason)
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        } catch {
            print("=== CREATE CONNECTION")
            return nil
        }
        return dbQueue
    }
    
    private func createTables() -> Void {
        
        do {
            
            try dbQueue!.write { db in
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
            print(error1.localizedFailureReason)
            print(error1.localizedDescription)
            print(error1.description)
            print(error1)
        }catch {
            print("=== CREATE TABLE ERROR")
        }
    }
}

