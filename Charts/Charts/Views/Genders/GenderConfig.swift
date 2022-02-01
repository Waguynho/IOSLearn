
import SwiftUI

struct GenderConfig: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding public var enablePercentage : Bool 
    @Binding public var enableDarkMode: Bool 
    
   
    var body: some View {
        
        VStack (alignment: .trailing) {
            
            HStack (alignment: .top){
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Done")
                    Image(systemName: "menubar.arrow.down.rectangle")
                        .font(.largeTitle)
                })
                    .padding(.bottom, 25)
            }
            
            
            Toggle(isOn: $enablePercentage) {
                Text("By Percentage").bold()
            }
            
            Toggle(isOn: $enableDarkMode) {
                Text("Dark Mode").bold()
            }
            
            Spacer()
        }
        .padding(10)
    }
}

struct GenderConfig_Previews: PreviewProvider {

    @State  var darkMode2: Bool = false

    static var previews: some View {

        GenderConfig(enablePercentage: .constant(false), enableDarkMode: .constant(true))

    }
}
