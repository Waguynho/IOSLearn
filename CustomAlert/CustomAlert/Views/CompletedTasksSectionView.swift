//
//  CompletedTasksSectionView.swift
//  CustomAlert
//
//  Created by Wagner Santos on 10/01/22.
//

import Foundation
import SwiftUI

struct CompletedTasksSectionView: View {
    
    // MARK: - Properties
    let count: Int
    
    // MARK: - View
    var body: some View {
        Section {
            HStack {
                Spacer()
                    
                Text("Você completou \(count) tarefas! 🎉")
                    .multilineTextAlignment(.center)
                    
                Spacer()
            }
        }
    }
}
