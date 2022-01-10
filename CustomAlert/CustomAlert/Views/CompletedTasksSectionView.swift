
import SwiftUI

struct CompletedTasksSectionView: View {
    
    // MARK: - Properties
    let count: Int
    
    // MARK: - View
    var body: some View {
        Section {
            HStack {
                Spacer()
                    
                Text("Você completou \(count) tarefas! 🎉")
                    .multilineTextAlignment(.center)
                    
                Spacer()
            }
        }
    }
}
