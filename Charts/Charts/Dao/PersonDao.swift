
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
    
    mutating func initializePersons () {
        
        var maria = Person(25, .female)
        var joana = Person(67, .female)
        var fernanda = Person(33, .female)
        var judas = Person(45, .male)
        var joao = Person(88, .male)
        
        persons.append(maria)
        persons.append(joana)
        persons.append(fernanda)
        persons.append(judas)
        persons.append(joao)
    }
}


