
import Foundation

public final class ChatModel: ObservableObject {
    public var text = ""
    @Published public var arrayOfMessages : [String] = []
    @Published public var arrayOfPositions : [BubblePosition] = []
    @Published public var position = BubblePosition.right
    
 public   init(_ text: String){
        self.text = text
    }
    
}
