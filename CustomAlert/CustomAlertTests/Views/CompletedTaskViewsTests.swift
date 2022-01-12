import XCTest
import SnapshotTesting

@testable import CustomAlert

final class CompletedTasksViewTests : XCTestCase {
    
    func test_completed_tasks_view() {
        
        let view: Sut = .init()
        
        _ = verifySnapshot(matching: view, as: .image, record: false, snapshotDirectory: snapshotDirectory)
    }
    

    
    
}

extension CompletedTasksViewTests {
    typealias Sut = CompletedTasksView
    
    private var snapshotDirectory: String {
        #filePath.replacingOccurrences(
            of: "Views/CompletedTaskViewsTests.swift",
            with: "__Snapshots__/CompletedTasksViewTests"
        )
    }
}
