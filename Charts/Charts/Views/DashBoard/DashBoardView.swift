

import SwiftUI

struct DashBoardView: View {
    
    @State public var isMultipleCharts: Bool = true
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    Text("Dash Board")
                        .bold()
                        .font(.largeTitle)
                    
                    NavigationLink(destination: DashBoardConfig(enableMultipleCharts: $isMultipleCharts)) {
                        Image(systemName: "pencil.circle.fill")
                            .font(.title3)
                    }
                }
                .padding(.top, -25)
                
                if isMultipleCharts {
                    GenderChart()
                }else{
                    SampleChart()
                }
                
            }
        }
        .padding(.top, -40)
        //.navigationBarTitleDisplayMode(.automatic)
        
    }
}


struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
