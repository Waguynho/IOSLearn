import Foundation

public class Person {
    
    public var age: Int
    public var gender: Gender
    
    init(_ age: Int, _ gender: Gender) {
        self.age = age
        self.gender = gender
    }
}

public enum Gender {
     case male
     case female
 }
