import NewRelic
import SwiftUI

@main
struct CustomAlertApp: App {
    
    private let wsToken = "AA172c324867c49c09ddba21fb8690f87b4ae0acb6-NRMA"
    private let temporaryAppToken = "AAd59a623a06e61d7569e1b9902b6d767ec946af4d-NRMA"
    private let wsToken1 = "AA527f8eacca956cb6e5452f00aaa0f98af2b42bd6-NRMA"
    
    init(){
//        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_NetworkRequestEvents)
//        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_RequestErrorEvents)
//        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_CrashReporting)
//        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_HandledExceptionEvents)
//        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_InteractionTracing)
//        NewRelic.enableFeatures(NRMAFeatureFlags.NRFeatureFlag_GestureInstrumentation)
        
        NewRelic.start(withApplicationToken:  temporaryAppToken)
    }
    
    var body: some Scene {
        WindowGroup {
         UncompletedTasksView()
         // PriorityPieChart()
        }
    }
}
