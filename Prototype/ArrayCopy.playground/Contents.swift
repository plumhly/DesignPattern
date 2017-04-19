//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject, NSCopying {
    var name: String
    var country: String
    init(name: String, country: String) {
        self.country = country
        self.name = name
//        super.init()
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: self.name, country: self.country)
    }
}

do {
    var people = [
        Person(name: "Joe", country: "France"),
        Person(name: "Bob", country: "USA")
    ]

    var otherPeople = people
    otherPeople[0].country = "China"
    print(people[0].country)
}

//round 2
func deepCopy(data: [AnyObject]) -> [AnyObject] {
    return data.map({ (item) -> AnyObject in
        if ((item is NSCopying) && (item is NSObject)) {
            return (item as! NSObject).copy() as AnyObject
        } else {
            return item
        }
    })
}

do {
    var people = [
        Person(name: "Joe", country: "France"),
        Person(name: "Bob", country: "USA")
    ]
    
    var otherPeople = deepCopy(data: people) as! [Person]
    otherPeople[0].country = "China"
    print(people[0].country)
}




