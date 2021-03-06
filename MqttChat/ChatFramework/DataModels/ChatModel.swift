
import Foundation
import Combine
import SwiftUI

public final class ChatModel: ObservableObject {
    
    private var serviceMqtt = ChatService()
    private var cancellable: Set<AnyCancellable> = .init()
    public var text = ""
    private var isScribe = false
    
    @Published public var arrayOfMessages : [String] = []
    @Published public var arrayOfPositions : [BubblePosition] = []
    @Published public var position = BubblePosition.right
    
    public init() {
        Task {
            _ = try await serviceMqtt.connect()
            _ = try await serviceMqtt.subscribe()
            serviceMqtt.addListener()
        }
        
        setReceiverMenssage()
    }
    
    deinit {
        serviceMqtt.unsubscribe { value in
            print("Unsubscribe sucess \(value)")
        }
    }
    
    fileprivate func setSenderMenssage(_ menssage: String) {
        position = .left
        arrayOfPositions.append(position)
        arrayOfMessages.append(menssage)
    }
    
    fileprivate func setReceiverMenssage() {
        serviceMqtt.messangeObservable
            .subscribe(on: DispatchQueue.main)
            .sink(receiveValue: executeCallBack)
            .store(in: &cancellable)
    }
    
    public func sendMenssage(menssage: String){
        setSenderMenssage(menssage)
        serviceMqtt.publish(menssage: menssage)
        text = ""
    }
    
    func executeCallBack(_ msg: String){
        DispatchQueue.main.async {
            self.position = .right
            self.arrayOfPositions.append(self.position)
            self.arrayOfMessages.append(msg)
        }
    }
    
}
