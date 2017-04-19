//
//  Product.swift
//  SportsStores
//
//  Created by libo on 2017/4/8.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class Product: NSObject, NSCopying {
    private(set) var name: String
    private(set) var descript: String
    private(set) var category: String
    private var stockLevelBackingValue: Int = 0
    private var priceBackingValue: Double = 0
    
    
    init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        self.name = name
        self.descript = description
        self.category = category
        super.init()
        self.price = price
        self.stockLevelBackingValue = stockLevel
    }
    
    var stockLevel: Int {
        get {
            return stockLevelBackingValue
        }
        set {
            stockLevelBackingValue = max(0, newValue)
        }
    }
    
    private(set) var price: Double {
        get {
            return priceBackingValue
        }
        set {
            priceBackingValue = max(1, newValue)
        }
    }
    
    var stockValue: Double {
        get {
            return price * Double(stockLevel)
        }
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product(name: self.name, description: self.descript, category: self.category, price: self.price, stockLevel: self.stockLevel)
    }

}
