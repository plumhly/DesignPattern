//
//  main.swift
//  ObjectTemplate
//
//  Created by libo on 2017/4/6.
//  Copyright © 2017年 libo. All rights reserved.
//

import Foundation


class Product: NSObject {
    var text: String = "libo"
    var name: String
    var descript: String
    var price: Double
    var stock: Int
    
    init(name: String, description: String, price: Double, stock: Int) {
        self.name = name
        self.descript = description
        self.price = price
        self.stock = stock
    }
    
    
    func calculateTax(rate: Double) -> Double {
        return self.price * rate
    }
    
    
}



do {
    var products = [ ("Kayak", "A boat for one person", 275.0, 10), ("Lifejacket", "Protective and fashionable", 48.95, 14), ("Soccer Ball", "FIFA-approved size and weight", 19.5, 32)];
    
    func calculateTax(product: (String, String, Double, Int)) -> Double {
        return product.2 * 0.2
    }
    
    func calculateStockValue(tuples: [(String, String, Double, Int)]) -> Double {
        return products.reduce(0, { (total, product) -> Double in
            return total + product.2 * Double(product.3)
        })
    }
    
    print("Sales tax for Kayak: $\(calculateTax(product: products[0]))");
    print("Total value of stock: $\(calculateStockValue(tuples: products))");
    
}

do {
    var products = [Product(name: "Kayak", description: "A boat for one person", price: 275.0, stock: 10), Product(name: "Lifejacket", description: "Protective and fashionable",price: 48.95, stock: 14), Product(name: "Soccer Ball", description: "FIFA-approved size and weight", price: 19.5, stock: 32)]
    func caculateTax(product: Product) -> Double {
        return product.price * 0.2
    }
    
    func calculateStockValue(productsArray:[Product]) -> Double { return productsArray.reduce(0, {(total, product) -> Double in return total + (product.price * Double(product.stock)) })
    }

}

do {
    print("====== test as is =======")
    
    var things: [Any] = [
        0,
        0.0
    ]
    
    for thing in things {
        switch thing {
            
        case is Int:
            print("整数0")
        case 0 as Double:
            print("浮点0")
        default:
            print("default")
        }
    }
}

do {
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
    

    do {
        var data = NSMutableArray(objects: 10, "iOS", Person(name: "libo", country: "China"))
        var copyData = data.mutableCopy() as! NSArray
        data[0] = 20
        data[1] = "MAC OS"
        (data[2] as! Person).name = "plum"
        print("\(copyData[0])  \(copyData[1])  \((copyData[2] as! Person).name)")
    }
    
    do {
        print("=======")
        var data = NSMutableArray(objects: 10, "iOS", Person(name: "libo", country: "China"))
        var copyData = NSMutableArray(array: (data as NSArray) as! [Any], copyItems: true)
        data[0] = 20
        data[1] = "MAC OS"
        (data[2] as! Person).name = "plum"
        print("\(copyData[0])  \(copyData[1])  \((copyData[2] as! Person).name)")
    }
    
}

