
import SwiftUI

struct PriorityChartConfig: View {
    
    @Binding public var filterType: String
    @State var nameFilter: String
    

    
    var body: some View {
        
        VStack (spacing: 8) {
            
            Picker("Type Chart", selection: $filterType) {
                
                Image(systemName: "flag")
                    .tag("tag-flag")
                    .font(.largeTitle)
                
                Image(systemName: "checkmark.circle.fill")
                    .tag("tag-done")
                    .font(.largeTitle)
            }            .pickerStyle(.segmented)
            .clipped()
            .contentShape(Circle())
            .onChange(of: filterType, perform: { filter in
                
                changeFilterName()
            })
            
            Text(nameFilter)
            
            Spacer()
        }
        .padding()
        .padding(.top, 15)
    }
    
    fileprivate func changeFilterName() {
        if filterType == "tag-flag"{
            nameFilter = "By Priority"
        }else{
            nameFilter = "By Done"
        }
    }
}
struct PriorityChartConfig_Previews: PreviewProvider {
    static var previews: some View {
        PriorityChartConfig(filterType: .constant("tag-flag"), nameFilter: "xx")
    }
}
