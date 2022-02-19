//
//  PriotityLineChart.swift
//  CustomAlert
//
//  Created by Wagner Santos on 10/02/22.
//
import Foundation
import SwiftUI
import NewRelic

struct PriorityLineChart : View {
    
    private var temp: Int? = nil
    
    
    
    var body: some View {
        VStack {
            Text("Line chart")
        }.onAppear(perform: {
            
            executeHttpCalls()
            
            executeHandledException()
            
          //let resultAtt =  NewRelic.setAttribute("wscustom", value: "ws1")
            
            do {
                try raiseException()
                let attt = NewRelic.crashNow("Test Crash Ws ")
            } catch {
                NewRelic.recordError(error, attributes: [ "int" : 1, "Test Group" : "Wagner teste error" ])
               //let x = 9 + temp! //Crash aplication
            }
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
            let url = URL(string: uri)
        else {
            
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                
                print("sucessso ws \(data)")
            } else {
                print(error)
                print("Erro ao fazer a consulta do preço.")
            }
        }
        task.resume()
    }
    
    fileprivate func executeCrashApplication() {
        var x = temp!
        print(x)
    }
    
    fileprivate func executeHandledException() {
        do {
            try raiseException()
        } catch  {
            
        }
    }
    
    fileprivate func executeHttpCalls() {
        requestPriceBitcoin(uri: "https://cs193p.sites.stanford.edu/xptoZZ")
        requestPriceBitcoin(uri: "https://cs193p.sites.stanford.edu")
        requestPriceBitcoin(uri: "https://www.google.com.br")
    }
}



