//
//  Logger.swift
//  SportsStores
//
//  Created by libo on 2017/4/9.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

let productLogger = Logger<Product>(callBack: { (p) in
    print("Change: \(p.name) \(p.stockLevel) items in stock")
})

   final class Logger<T> where T: NSObject, T: NSCopying {
    var dataItems: [T] = []
    var callBack: (T) -> Void
    
    private let myQueue = DispatchQueue(label: "muyqueu", qos: .default, attributes:.concurrent, autoreleaseFrequency:.inherit, target: nil)
    private let callBackQueue = DispatchQueue(label: "callBackQ")
    
    fileprivate init(callBack: @escaping (T) -> Void, protect: Bool = true) {
        self.callBack = callBack
        if protect {
            self.callBack = {
                (item: T) in
                self.callBackQueue.sync {
                    callBack(item)
                }
            }
        }
        
    }
    
    
    
    func logItem(item: T) {
        myQueue.async(group: nil, qos: .default, flags:.barrier) { 
            self.dataItems.append(item.copy() as! T)
            self.callBack(item)
        }
        
    }
    
    func processItems() {
        myQueue.sync {
            for item in dataItems {
                callBack(item)
            }
        }
        
    }
    
}
