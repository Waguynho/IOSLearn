
import XCTest
import Combine
@testable import ChatFramework

final class ChatFrameworkTests: XCTestCase {
    
    func test_integration() async throws {
        
        let server: Sut = .init(client: .mock(identifier: UUID().uuidString))
        let client: Sut = .init(client: .mock(identifier: UUID().uuidString))
        
        var cancellable = Set<AnyCancellable>()
        var valueMessage: String = ""
        
        let exp = expectation(description: "Should call connect")
        exp.expectedFulfillmentCount = 5
        
        let isServerConnected = try await server.connect()
        let isClientConnected = try await client.connect()
        exp.fulfill()
        
        let valueServer = try await server.subscribe()
        let valueClient = try await client.subscribe()
        exp.fulfill()
        
        server.addListener(calback: { value in
            XCTAssertEqual(value, "Add listener sucess!")
            exp.fulfill()
        })
        
        client.addListener(calback: { value in
            XCTAssertEqual(value, "Add listener sucess!")
            exp.fulfill()
        })
        
        client.messangeObservable
            .sink { value in
                valueMessage = value
                exp.fulfill()
            }
            .store(in: &cancellable)
        
        server.publish(menssage: "Teste message")

        await waitForExpectations(timeout: 3)
        
        XCTAssertTrue(isServerConnected)
        XCTAssertTrue(isClientConnected)
        
        XCTAssertEqual(valueServer, "Subscribed success!")
        XCTAssertEqual(valueClient, "Subscribed success!")
        
        XCTAssertEqual(valueMessage, "Teste message")
    }
}

private extension ChatFrameworkTests {
    
    typealias Sut = ChatService
    
     func post_unsubscribe(value: String){
        XCTAssertEqual(value, "Unsubscribe success!")
    }
}
