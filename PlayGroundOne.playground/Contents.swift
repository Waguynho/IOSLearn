import UIKit

var greeting:String = "Hello Ws!"
var age:Int = 55
let isGreeting = true
print("Say:  \(greeting) \nWith number: \(age)")
var message = age > 60 ? "Idoso" : "Jovem"
print(message)
let result:Double = (Double("13.5")! + 1.6)

var dicionary: [Int:String] = [
    1:"Maria",
    2:"Joao",
    3:"Helena"
]

for (cod, name) in dicionary {
    print("Code: \(cod) name: \(name)")
}
