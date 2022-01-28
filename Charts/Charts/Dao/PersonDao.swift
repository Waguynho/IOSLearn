
import Foundation

struct PersonDao {
    
    private var persons: [Person] = []
    
    init(){
        initializePersons()
    }
    
    public func getPersons() -> [Person] {
        
        return persons
    }
    
    public func countBy(_ gender: Gender) -> Int {
        
        return persons.filter({$0.gender == gender}).count
    }
    
    public func countPercentageBy(_ gender: Gender) -> Int {
        
        let items = Double(persons.filter({$0.gender == gender}).count)
        let total = Double(persons.count)
        let percentage = Int(round((items / total) * 100))
        
        return percentage
    }
    
    mutating func initializePersons () {
        
        let sarah = Person(32, .female)
        let maria = Person(25, .female)
        let joana = Person(67, .female)
        let fernanda = Person(33, .female)
        let judas = Person(45, .male)
        let joao = Person(88, .male)
        let hermo = Person(77, .unown)
        
        persons.append(maria)
        persons.append(joana)
        persons.append(fernanda)
        persons.append(judas)
        persons.append(joao)
        persons.append(sarah)
        persons.append(hermo)
    }
}


