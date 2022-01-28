//
//  DashBoardConfig.swift
//  Charts
//
//  Created by Wagner Santos on 28/01/22.
//

import SwiftUI

struct DashBoardConfig: View {
    
    @Binding public var enableMultipleCharts: Bool
    
    var body: some View {
        VStack() {
            
            Toggle(isOn: $enableMultipleCharts) {
                Text("Multiple Charts?").bold()
                
            }
        }
        .padding(.top , -300)
        .padding(.horizontal , 15)
        //.frame(width: 300, height: 300, alignment: .topLeading)
        
    }
}

//struct DashBoardConfig_Previews: PreviewProvider {
//    static var previews: some View {
//        DashBoardConfig()
//    }
//}
