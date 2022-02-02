//
//  TodoItem.swift
//  CustomAlert
//
//  Created by Wagner Santos on 07/01/22.

import UIKit

extension TodoItem.Priority: RawRepresentable {
    
public typealias RawValue = (name: String, color: UIColor)

    public init?(rawValue: RawValue) {
        switch rawValue {
        case (name: "Urgent", color: UIColor.red): self = .urgent
        case (name: "High", color: UIColor.orange): self = .high
        case (name: "Normal", color: UIColor.blue): self = .normal
        case (name: "Low", color: UIColor.gray): self = .low
        default: return nil
        }
    }

       public var rawValue: RawValue {
            switch self {
            case .urgent: return (name: "Urgent", color: UIColor.red)
            case .high: return (name: "High", color: UIColor.orange)
            case .normal: return (name: "Normal", color: UIColor.blue)
            case .low: return (name: "Low", color: UIColor.gray)
        }
    }
}
