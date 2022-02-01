import Foundation
import Combine

public class Vehicle {
    @Published public var wheels : Int
    
    public init(wheels: Int) {
        self.wheels = wheels
        
        // Publishing values with delay
        for i in 2...6 {
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + Double(i)) {
                self.wheels = i
            }
        }
    }
}

// ===== RUN THE CODE BELLOW IN PLAY GROUND

//let cancellable = vehicle.$wheels // Accessing publisher with $ operator.
//    .sink { wheels in
//        print("Number of wheels: \(wheels)")
//        if wheels ==  4 {
//            cancellable.cancel()
//        }
//}


