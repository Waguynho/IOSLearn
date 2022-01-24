//
//  ChatFrameworkTests.swift
//  ChatFrameworkTests
//
//  Created by Tayrony Oliveira on 18/01/22.
//

import XCTest
@testable import ChatFramework

class ChatFrameworkTests: XCTestCase {


    func test_integration() throws {
        let sut: Sut = .init(client: .mock())
        
        let expConnect = expectation(description: "Should call connect")
        sut.connect { value in
            XCTAssertEqual(value, "Connected success!")
            expConnect.fulfill()
        }
        
        waitForExpectations(timeout: 10)
    }

}

extension ChatFrameworkTests {
    
    typealias Sut = ChatService
}
