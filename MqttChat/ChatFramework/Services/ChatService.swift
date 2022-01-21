

import Foundation
import MQTTNIO
import NIO
import Combine

public final class ChatService {
    
    private let identifier = UUID().uuidString
    
    private let myTopic = "chatModel/myTopic"
    
    let messangeObservable: PassthroughSubject<String, Never> = .init()
    
    let client: MQTTClient
    
    init(){
        
        client = MQTTClient (
            host: "test.mosquitto.org",/*https://test.mosquitto.org,  https://www.hivemq.com, https://mqtt.eclipseprojects.io*/
            port: 1883,
            identifier: identifier,
            eventLoopGroupProvider: .createNew
        )
    }

    
    fileprivate func AddListener() {
        self.client.addPublishListener(named: "myListener") { result in
            switch result {
            case .failure(let error):
                print("Error addPublishListener: \(error)")
            case .success(let publishInfo):
                if publishInfo.topicName == "chatModel/myTopic" {
                    let msgReceived = publishInfo.payload
                    self.receiveMessage(buffer: msgReceived)
                    
                    //self.callBack()
                }
            }
        }
    }
    
    public func connect(){
        client.connect().whenComplete { result in
            switch result {
            case .success:
                self.AddListener()
                self.subscribe()
                print("Connected success!")
            case let .failure(error):
                print("Error connect: \(error)")
            }
        }
    }
    
    public func subscribe(){
        let subscription: MQTTSubscribeInfo = .init(topicFilter: myTopic, qos: .atLeastOnce)
        client.subscribe(to: [subscription]).whenComplete { result in
            switch result {
            case .success:
                print("Subscribed success!")
            case let .failure(error):
                print("Error subscribe: \(error)")
            }
        }
    }
    
    public func unsubscribe(){
        client.unsubscribe(from: [myTopic]).whenComplete { result in
            switch result {
            case .success:
                print("Unsubscribe success!")
            case let .failure(error):
                print("Error unsubscribe: \(error)")
            }
        }
    }
    
    public func publish(menssage: String){
        client.publish(
            to: myTopic,
            payload: ByteBuffer(string: menssage),
            qos: .atLeastOnce
        ).whenComplete { result in
            switch result {
            case .success:
                print("Publish success!")
            case let .failure(error):
                print("Error publish: \(error)")
            }
        }
    }
    
    private func receiveMessage(buffer: ByteBuffer!) {
        
        var bytesBuffer = buffer.getBytes(at: 0, length: buffer.readableBytes)
        
        if let string = String(bytes: bytesBuffer!, encoding: .utf8) {
            print(string)
            messangeObservable.send(string)
        } else {
            print("not a valid UTF-8 sequence")
        }
    }
}
