
import Foundation
import Combine

public final class ChatModel: ObservableObject {
    
    private var serviceMqtt = ChatService()
    private var cancellable: Set<AnyCancellable> = .init()
    public var text = ""
    private var isScribe = false
    
    @Published public var arrayOfMessages : [String] = []
    @Published public var arrayOfPositions : [BubblePosition] = []
    @Published public var position = BubblePosition.right
    
    public init() {
        self.serviceMqtt.connect()
        setReceiverMenssage()
    }
    
    deinit {
        serviceMqtt.unsubscribe()
    }
    
    fileprivate func setSenderMenssage(_ menssage: String) {
        position = .left
        arrayOfPositions.append(position)
        arrayOfMessages.append(menssage)
    }
    
    fileprivate func setReceiverMenssage() {
        
        serviceMqtt.messangeObservable
            .subscribe(on: DispatchQueue.main)
            .sink { menssage in
                self.position = .right
                self.arrayOfPositions.append(self.position)
                
                
                self.arrayOfMessages.append(menssage)
            }
            .store(in: &cancellable)
    }
    
    public func sendMenssage(menssage: String){
        
        setSenderMenssage(menssage)
        serviceMqtt.publish (menssage: menssage)
        text = ""
    }
    
    func executeCallBack(){
        
    }
    
}
