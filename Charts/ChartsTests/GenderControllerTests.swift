//
//  GenderControllerTests.swift
//  ChartsTests
//
//  Created by Wagner Santos on 28/01/22.
//

import XCTest
import SwiftUICharts

@testable import Charts

class GenderControllerTests: XCTestCase {
    
    
    
    func test_chart_data() throws {
        let (sut, data) = makeSut()
        
        let dataChart = sut.getDataBy(typeChart: .Percentage)
        

        
        XCTAssertEqual(dataChart, data )
    }
    
}

extension GenderControllerTests {
    typealias Sut = GenderController
    
    typealias Data = ChartData
    
    func makeSut() -> (Sut, Data) {
        let sut: Sut = .init()
        let data: ChartData = ChartData( values:
                                            [
                                                ("Male %",PersonDao().countPercentageBy(.male)),
                                                ("Female %",PersonDao().countPercentageBy(.female)),
                                                ("Unown %",PersonDao().countPercentageBy(.unown))
                                            ])
        return (sut, data)
    }
}

extension ChartData: Equatable{}

public func == (lhs: ChartData, rhs: ChartData) -> Bool {
    return lhs.self == rhs.self;
}
