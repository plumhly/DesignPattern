//
//  BackupServer.swift
//  Singleton
//
//  Created by libo on 2017/4/9.
//  Copyright © 2017年 libo. All rights reserved.
//

import Cocoa

class DataItem {

    enum ItemType: String{
        case Email = "Email Address"
        case Phone = "Phone Number"
        case Card = "Credit Card Number"
    }
    
    var type: ItemType
    var data: String
    
    init(type: ItemType, data: String) {
        self.type = type
        self.data = data
        
    }
    
}

final class BackupServer {
    var name: String
    private var data = [DataItem]()
    static let server = BackupServer(name: "MianServer")
    
    private let myQueue = DispatchQueue(label: "array0")
    
    private init(name: String) {
        
        self.name = name
        globalLooger.log(msg: "create new server \(name)")
    }
    
    func backup(item: DataItem) {
        myQueue.sync {
            data.append(item)
            globalLooger.log(msg: "\(name) back up item of type: \(item.type.rawValue)")
        }
        
    }
    
    func getData() -> [DataItem] {
        return data
    }
}
