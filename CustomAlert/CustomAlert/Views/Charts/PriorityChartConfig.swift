
import SwiftUI

public struct PriorityChartConfig: View {
    
    @Binding public var filterType: String
    @State var nameFilter: String
    
   public var body: some View {
       
        VStack (spacing: 8) {
            
            Picker("Type Chart", selection: $filterType) {
                
                Image(systemName: "flag")
                    .tag("tag-priority")
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
            .onAppear(perform:  {
                changeFilterName()
            })
            
            Text(nameFilter)
            
            Spacer()
            
            
        }
        .padding()
        .padding(.top, 15)
       
   }
        
    
    fileprivate func changeFilterName() {
        if filterType == "tag-priority"{
            nameFilter = "By Priority"
        }else{
            nameFilter = "By Conclusion"
        }
    }
}
struct PriorityChartConfig_Previews: PreviewProvider {
    static var previews: some View {
        PriorityChartConfig(filterType: .constant("tag-priority"), nameFilter: "any")
    }
}
