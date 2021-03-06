

import Foundation
import MQTTNIO
import NIO
import Combine
import NIOCore
import UIKit

struct Response: Codable {
    let identifier: String
    let message: String
}

public struct ChatService {
    
    private let myTopic = "chatModel/myTopic"
    
    let messangeObservable: PassthroughSubject<String, Never> = .init()
    
    let client: MQTTClient
    let identifier = UUID().uuidString
    
    init(client: MQTTClient = .live()) {
        self.client = client
    }
    
    public func connect() async throws -> Bool {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Bool, Error>) in
            client.connect().whenComplete { result in
                switch result {
                case .success:
                    print("Connected success!")
                    continuation.resume(with: .success(true))
                case let .failure(error):
                    print("Error connect: \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func addListener(
        calback: @escaping (String) -> Void = { _ in }
    ) {
        client.addPublishListener(named: "myListener-\(identifier)") { result in
            switch result {
            case .failure(let error):
                print("Error addPublishListener: \(error)")
                calback("Error addPublishListener: \(error)")
                
            case .success(let publishInfo):
                let msgReceived = publishInfo.payload
                self.receiveMessage(buffer: msgReceived)
                calback("Add listener sucess!")
            }
        }
    }
    
    public func subscribe() async throws -> String {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<String, Error>) in
            let subscription: MQTTSubscribeInfo = .init(topicFilter: myTopic, qos: .atLeastOnce)
            client.subscribe(to: [subscription])
                .whenComplete { result in
                switch result {
                case .success:
                    print("Subscribed success!")
                    continuation.resume(with: .success("Subscribed success!"))
                    
                case let .failure(error):
                    print("Error subscribe: \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func unsubscribe(
        _ postUnsubscribe: @escaping (String) -> Void?
    ){
        client.unsubscribe(from: [myTopic]).whenComplete { result in
            switch result {
            case .success:
                print("Unsubscribe success!")
                postUnsubscribe("Unsubscribe success!")
            case let .failure(error):
                print("Error unsubscribe: \(error)")
                postUnsubscribe("Error unsubscribe: \(error)")
            }
        }
    }
    
    public func publish(menssage: String) {
        
        let response = Response(
            identifier: identifier,
            message: menssage
        )
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(response)
            
            client.publish(
                to: myTopic,
                payload: ByteBuffer(data: jsonData),
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
        catch {}
    }
    
    private func receiveMessage(buffer: ByteBuffer!) {
        if let jsonData = buffer.getData(at: 0, length: buffer.readableBytes) {
            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(Response.self, from: jsonData)
                
                if response.identifier != identifier {
                    messangeObservable.send(response.message)
                }
            }
            catch {
            }
            
        } else {
            print("not a valid UTF-8 sequence")
        }
    }
}

extension MQTTClient {
    
    static func live(identifier: String = UUID().uuidString) -> MQTTClient {
        .init(
            host: "test.mosquitto.org",/*https://test.mosquitto.org,  https://www.hivemq.com, https://mqtt.eclipseprojects.io*/
            port: 1883,
            identifier: identifier,
            eventLoopGroupProvider: .createNew
            
        )
    }
    
    static func mock(
        host: String = "test.mosquitto.org",
        port: Int = 1883,
        identifier: String = UUID().uuidString,
        eventLoopGroupProvider: NIOEventLoopGroupProvider = .createNew
    ) -> MQTTClient {
        .init(
            host: host,
            port: port,
            identifier: identifier,
            eventLoopGroupProvider: eventLoopGroupProvider
        )
    }
}
