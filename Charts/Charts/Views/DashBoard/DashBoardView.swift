

import SwiftUI

struct DashBoardView: View {
    
    @State public var isMultipleCharts: Bool = true
    @State public var opt: String = ""
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    Text("Dash Board")
                        .bold()
                        .font(.largeTitle)
                    
                    NavigationLink(destination: DashBoardConfig(enableMultipleCharts: $isMultipleCharts, opt: $opt)) {
                        Image(systemName: "pencil.circle.fill")
                            .font(.title3)
                    }
                }
                .padding(.top, -25)
                
                if isMultipleCharts {
                    MultipleCharts()
                }else{
                    GenderChart()
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
