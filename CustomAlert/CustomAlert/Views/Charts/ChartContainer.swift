//
//  ChartContainer.swift
//  CustomAlert
//
//  Created by Wagner Santos on 08/02/22.
//

import SwiftUI

struct ChartContainer: View {
    var body: some View {
        VStack {
            TodoPieChart()
        }
        .frame(width: 300, height: 300, alignment: .trailing)
    }
}

struct ChartContainer_Previews: PreviewProvider {
    static var previews: some View {
        ChartContainer()
    }
}
