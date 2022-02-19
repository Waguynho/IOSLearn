
import SwiftUI
import NewRelic
@main
struct CustomAlertApp: App {
    
    private let wsToken = "AA172c324867c49c09ddba21fb8690f87b4ae0acb6-NRMA"
    private let temporaryAppToken = "AAd59a623a06e61d7569e1b9902b6d767ec946af4d-NRMA"
    private let siggaToken = ""
    
    
    init(){
        
        NewRelic.enableCrashReporting(true)
        let value = NSString(string: "ws3")
        NRLogger.setLogLevels(NRLogLevelALL.rawValue)
        NewRelic.start(withApplicationToken:  wsToken)
        let result = NewRelic.setAttribute("wscustom", value: value)
        let result2 = NewRelic.setAttribute("DISGRACA", value: value)
        var x = 0
    }
    
    var body: some Scene {
        WindowGroup {
            UncompletedTasksView()
            // PriorityPieChart()
        }
    }
}
