//
//  Date.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.
//

import Foundation


extension Date {
    
    // MARK: - Methods
    func daysAdded(_ days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    func dateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        return dateFormatter.string(from: date)
    }
}
