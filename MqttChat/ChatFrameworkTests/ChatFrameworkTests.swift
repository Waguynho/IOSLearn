
import XCTest
@testable import ChatFramework

class ChatFrameworkTests: XCTestCase {
    
    func test_integration() throws {
        
        let sut: Sut = .init(client: .mock())
        
        let exp = expectation(description: "Should call connect")
        
        sut.connect(
            postConnect: { value in
                XCTAssertEqual(value, "Connected success!")
                exp.fulfill()
                
                sut.subscribe(postSubscribe: { value in
                   // XCTAssertEqual(value, "Subscribed success!")
                    exp.fulfill()
                })
            }
        )
        
//        sut.addListener(postListener: { value in
//            XCTAssertEqual(value, "Add listener sucess!")
//            exp.fulfill()
//        })
//


        waitForExpectations(timeout: 10)
    }
}

private extension ChatFrameworkTests {
    
    typealias Sut = ChatService
    
     func post_unsubscribe(value: String){
        XCTAssertEqual(value, "Unsubscribe success!")
    }
}
