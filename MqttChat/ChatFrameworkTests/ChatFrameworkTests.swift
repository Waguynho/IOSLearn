
import XCTest
@testable import ChatFramework

class ChatFrameworkTests: XCTestCase {

    private let sut: Sut = .init(client: .mock())
    
    public func test_post_connect(value: String){
        let expConnect = expectation(description: "Should call connect")
        XCTAssertEqual(value, "Connected success!")
        expConnect.fulfill()
        waitForExpectations(timeout: 10)
    }
    
    public func test_post_listener(value: String){
        let expListener = expectation(description: "Should call addPublishListener")
        expListener.fulfill()
        XCTAssertEqual(value, "Add listener sucess!!!!")
        waitForExpectations(timeout: 10)
    }
    
    public func test_post_subscribe(value: String){
        let expSubscribe = expectation(description: "Should call subscribe")
        XCTAssertEqual(value, "Subscribed success!")
        expSubscribe.fulfill()
        waitForExpectations(timeout: 10)
    }
    
    public func test_post_unsubscribe(value: String){
        let expUnsubscribe = expectation(description: "Should call subscribe")
        XCTAssertEqual(value, "Unsubscribe success!")
        expUnsubscribe.fulfill()
        waitForExpectations(timeout: 10)
    }

    func test_integration() throws {
        
        sut.connect(postConnect: test_post_connect, postListener: test_post_listener, postSubscribe: test_post_subscribe)

        sut.unsubscribe(test_post_unsubscribe)
    }

}

extension ChatFrameworkTests {
    
    typealias Sut = ChatService
}
