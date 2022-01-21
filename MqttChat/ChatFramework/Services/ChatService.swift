

import Foundation
import MQTTNIO
import NIO
import Combine

public final class ChatService {
    let messangeObservable: PassthroughSubject<String, Never> = .init()
    
    let client = MQTTClient (
        host: "test.mosquitto.org",/*https://test.mosquitto.org,  https://www.hivemq.com, https://mqtt.eclipseprojects.io*/
        port: 1883,
        identifier: "myClient",
        eventLoopGroupProvider: .createNew
    )
    
    public init(){
        
    }
    
    public func connect(){
        client.connect().whenComplete { result in
            switch result {
            case .success:
                print("Connected success!")
            case let .failure(error):
                print("Error connect: \(error)")
            }
        }
    }
    
    public func subscribe(topic: String){
        let subscription: MQTTSubscribeInfo = .init(topicFilter: topic, qos: .atLeastOnce)
        client.subscribe(to: [subscription]).whenComplete { result in
            switch result {
            case .success:
                print("Subscribed success!")
            case let .failure(error):
                print("Error subscribe: \(error)")
            }
        }
        
        client.addPublishListener(named: "myListener") { result in
            switch result {
            case let .success(publish):
                var buffer = publish.payload
                let string = buffer.readString(length: buffer.readableBytes)
                print(string)
                self.messangeObservable.send(string!)
                
            case let .failure(error):
                print("Error addPublishListener: \(error)")
            }
        }
    }
    
    public func unsubscribe(topic: String){
        client.unsubscribe(from: [topic]).whenComplete { result in
            switch result {
            case .success:
                print("Unsubscribe success!")
            case let .failure(error):
                print("Error unsubscribe: \(error)")
            }
        }
    }
    
    public func publish(topic: String, menssage: String){
        client.publish(
            to: topic,
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
}
