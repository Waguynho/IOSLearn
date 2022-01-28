//
//  ChartsTests.swift
//  ChartsTests
//
//  Created by Wagner Santos on 26/01/22.
//

import XCTest
@testable import Charts

class PersonDaoTests: XCTestCase {

    func test_count_gender() throws {
        
        let sut = makeSut()
        
        let quantity = sut.countBy(.female)
        
        XCTAssertEqual(quantity, 4 )
    }
    
    func test_count_percentage() throws {
        
        let sut = makeSut()
        
        let percentage = sut.countPercentageBy(.male)
        
        XCTAssertEqual(percentage, 29 )
    }
}

extension PersonDaoTests {
    typealias Sut = PersonDao
    
    func makeSut() -> Sut {
            let sut: Sut = .init()
            return sut
        }
}
