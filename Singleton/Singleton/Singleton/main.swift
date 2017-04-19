//
//  main.swift
//  Singleton
//
//  Created by libo on 2017/4/9.
//  Copyright © 2017年 libo. All rights reserved.
//

import Foundation

let queue = DispatchQueue(label: "www.plum", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)

let group = DispatchGroup.init()

do {
    var server = BackupServer.server
    server.backup(item: DataItem(type: .Email, data: "libo@qq.com"))
    server.backup(item: DataItem(type: .Phone, data: "1908383889"))
    
    globalLooger.log(msg: "Back up tow item to \(server.name)")
    
    var otherServer = BackupServer.server
    otherServer.backup(item: DataItem(type: .Email, data: "plum@qq.com"))
    globalLooger.log(msg: "Back up one item to \(otherServer.name)")
    
    globalLooger.printLog()
}

do {
    
    
    for count in 0..<100 {
        queue.async(group: group, qos: .default, flags: .inheritQoS, execute: {
            BackupServer.server.backup(item: DataItem(type: .Email, data: "libo@qq.com"))
        })
    }
    
    _ = group.wait(timeout: .distantFuture)
    print("count:\(BackupServer.server.getData().count)")
}



