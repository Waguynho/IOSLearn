//
//  Chat.swift
//  MqttChat
//
//  Created by Wagner Santos on 18/01/22.
//

import SwiftUI
import ChatFramework

struct Chat: View {
    @ObservedObject var model = ChatModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                //MARK:- ScrollView
                CustomScrollView(scrollToEnd: true) {
                    LazyVStack {
                        ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                            ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ?.red : .purple) {
                                Text(model.arrayOfMessages[index])
                            }
                        }
                    }
                }.padding(.top)
                //MARK:- text editor
                HStack {
                    ZStack {
                        TextEditor(text: $model.text)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(.gray)
                    }.frame(height: 50)
                    
                    Button("send") {
                        if model.text != "" {
                            model.sendMenssage(menssage: model.text)
                        }
                    }
                }.padding()
            }
        }
    }
}
