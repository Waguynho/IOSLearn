//
//  PriotityLineChart.swift
//  CustomAlert
//
//  Created by Wagner Santos on 10/02/22.
//
import Foundation
import SwiftUI

struct PriorityLineChart : View {

    private var temp: String? = nil
   
   var body: some View {
       VStack {
          Text("Line chart")
       }.onAppear(perform: {

           requestPriceBitcoin(uri: "https://www.google.com.br")
           requestPriceBitcoin(uri: "https://cs193p.sites.stanford.edu/xpto")
           requestPriceBitcoin(uri: "https://dsfasdfasd.edu/xpto")
           
           do {
               try raiseException()
           } catch  {
               
           }
           
//                      var x = temp!
//                      print(x)
       })
   }
    
    func raiseException () throws {
        //throw new RuntimeException("A custom message here by Wagner")
        throw MyError.runtimeError("ws")
    }
    
    enum MyError: Error {
        case runtimeError(String)
    }
    
    public func requestPriceBitcoin(uri: String) {
            guard
                let url = URL(string: "https://www.google.com.br")
            else {
               
                return
            }
            let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil {
                   
                    print("sucessso ws")
                } else {
                    print(error)
                    print("Erro ao fazer a consulta do preço.")
                }
            }
            task.resume()
        }
}



