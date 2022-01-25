
import XCTest
@testable import ChatFramework

class ChatFrameworkTests: XCTestCase {
    
    func test_integration() async throws {
        
        let sut: Sut = .init(client: .mock())
        
        let exp = expectation(description: "Should call connect")
        exp.expectedFulfillmentCount = 2
        
        let isConnected = try await sut.connect()
        exp.fulfill()
        
        let value = try await sut.subscribe()
        exp.fulfill()
        
//        sut.addListener(postListener: { value in
//            XCTAssertEqual(value, "Add listener sucess!")
//            exp.fulfill()
//        })

        await waitForExpectations(timeout: 10)
        
        XCTAssertTrue(isConnected)
        XCTAssertEqual(value, "Subscribed success!")
    }
}

private extension ChatFrameworkTests {
    
    typealias Sut = ChatService
    
     func post_unsubscribe(value: String){
        XCTAssertEqual(value, "Unsubscribe success!")
    }
}
