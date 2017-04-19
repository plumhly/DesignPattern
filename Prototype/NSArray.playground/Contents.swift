//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Person : NSObject, NSCopying {
    var name:String
    var country: String
    
    init(name:String, country:String) {
        
        self.name = name;
        self.country = country;
        
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: self.name, country: self.country);
    }
    
    
}

var data = NSMutableArray(objects: 10, "iOS", Person(name: "libo", country: "China"))
var copyData = data.mutableCopy() as! NSArray
data[0] = 20
data[1] = "MAC OS"
(data[2] as! Person).name = "plum"
print("\(copyData[0])  \(copyData[1])  \((copyData[2] as! Person).name)")