import XCTest
import SnapshotTesting

@testable import CustomAlert

final class DataStoreTests: XCTestCase {
    
    func test_getMenuItemsCompletedTodoItemFalse() {
        let (sut,fields) = makeSut(completed: false)
        let view = sut.getMenuItems(selected: fields.todoItem)
        
        assertSnapshot(matching: view, as: .image, record: false)
        
    }
    
    func test_getMenuItemsCompletedTodoItemTrue() {
        let (sut,fields) = makeSut(completed: true)
        let view = sut.getMenuItems(selected: fields.todoItem)
        assertSnapshot(matching: view, as: .image, record: false)
        
    }
    
    func test_createTodoItem () throws {
        let (sut,fields) = makeSut(completed: false)
        let view = sut.getMenuItems(selected: fields.todoItem)
        
        let previewSize = sut.allTodoItems.count
        
        sut.create(fields.todoItem)
        
        do {
            
            XCTAssertTrue(sut.allTodoItems.count == (previewSize + 1))
            
        }catch{
            XCTFail("Error in test: \(error)")
        }
        
    }
    
    
}

extension DataStoreTests {
    typealias Sut = DataStore
    typealias Fields = (
        todoItem: TodoItem,
        ()
    )
    
    
    func makeSut(completed: Bool) -> (Sut,Fields) {
        let sut: Sut = .init()
        let todoItem = TodoItem(
            id: UUID(uuidString: "deadbeef-dead-beef-dead-beeddeadbeaf")!,
            title: "DummyTitle",
            description: "DummyDescription",
            priority: .high,
            date: Date(),
            completed: completed
        )
        return (sut, (todoItem,()))
    }
}
