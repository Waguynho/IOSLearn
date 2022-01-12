import XCTest
import SnapshotTesting

@testable import CustomAlert

final class DataStoreTests: XCTestCase {
    
    func test_getMenuItemsCompletedTodoItemFalse() {
        let (sut,fields) = makeSut(completed: false)
        let view = sut.getMenuItems(selected: fields.todoItem)
        
       _ = verifySnapshot(matching: view, as: .image, record: false, snapshotDirectory: snapshotDirectory)
        
    }
    
    func test_getMenuItemsCompletedTodoItemTrue() {
        let (sut,fields) = makeSut(completed: true)
        let view = sut.getMenuItems(selected: fields.todoItem)
        
        _ = verifySnapshot(matching: view, as: .image, record: false, snapshotDirectory: snapshotDirectory)
        
    }
    
    func test_createTodoItem () throws {
        let (sut,fields) = makeSut(completed: false)

        sut.create(fields.todoItem)
        
        XCTAssertEqual(sut.allTodoItems.count, 6 )    
    }
    
    
}

extension DataStoreTests {
    typealias Sut = DataStore
    typealias Fields = (
        todoItem: TodoItem,
        ()
    )
    
    private var snapshotDirectory: String {
        #filePath.replacingOccurrences(
            of: "Helpers/DataStoreTests.swift",
            with: "__Snapshots__/DataStoreTests"
        )
    }
    
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
