
import Foundation
import Combine

public final class ChatModel: ObservableObject {
    
    private var serviceMqtt = ChatService()
    private var cancellable: Set<AnyCancellable> = .init()
    public var text = ""
    let topicRequest = "chatModel/myTopic"
    
    @Published public var arrayOfMessages : [String] = []
    @Published public var arrayOfPositions : [BubblePosition] = []
    @Published public var position = BubblePosition.right
    
    public init() {
        self.serviceMqtt.connect()
            //serviceMqtt.subscribe(topic: topicRequest)
        setReceiverMenssage()
    }
    
    deinit {
        serviceMqtt.unsubscribe(topic: topicRequest)
    }
    
    fileprivate func setSenderMenssage(_ menssage: String) {
        position = .left
        arrayOfPositions.append(position)
        arrayOfMessages.append(menssage)
    }
    
    fileprivate func setReceiverMenssage() {

        serviceMqtt.messangeObservable.sink { menssage in
            self.position = .right
            self.arrayOfPositions.append(self.position)
            self.arrayOfMessages.append(menssage)
        }
        .store(in: &cancellable)
    }
    
    public func sendMenssage(menssage: String){
        setSenderMenssage(menssage)
        serviceMqtt.publish(topic: topicRequest, menssage: menssage)
        text = ""
    }
    
}
