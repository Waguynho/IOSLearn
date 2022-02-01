//
//  DashBoardConfig.swift
//  Charts
//
//  Created by Wagner Santos on 28/01/22.
//

import SwiftUI

struct DashBoardConfig: View {
    
    @Binding public var enableMultipleCharts: Bool
    @Binding public var opt: String
    
    var body: some View {
        VStack() {
            
            Toggle(isOn: $enableMultipleCharts) {
                Text("Multiple Charts?").bold()
                
            }
            
            Picker("Seasonal Photo", selection: $opt) {
                
                Image(systemName: "chart.line.uptrend.xyaxis")
                    .tag("tag-line")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .symbolRenderingMode(.monochrome)

                Image(systemName: "chart.bar.xaxis")
                    .tag("tag-bars")
                    .font(.custom("", size: 55))
                    .foregroundColor(.orange)
                    .symbolRenderingMode(.multicolor)
                
                Image(systemName: "star.fill")
                    .tag("tag-star")
                    .font(.custom("", size: 55))
                    .foregroundColor(.orange)
                    .symbolRenderingMode(.multicolor)

            }
            .pickerStyle(.segmented)
            .frame(width: 300)
            .clipped()
            .contentShape(Circle())
            //.padding(25)
            
        }
        .padding(.top , -300)
        .padding(.horizontal , 15)
    }
}

struct DashBoardConfig_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardConfig(enableMultipleCharts: .constant(true), opt: .constant("tag 1"))
    }
}
