import NewRelic
import SwiftUI

@main
struct CustomAlertApp: App {
    
    init(){
        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_NetworkRequestEvents)
        NewRelic.start(withApplicationToken: "AA172c324867c49c09ddba21fb8690f87b4ae0acb6-NRMA")
    }
    
    var body: some Scene {
        WindowGroup {
         UncompletedTasksView()
         // PriorityPieChart()
        }
    }
}
