//
//  NetworkPool.swift
//  SportsStores
//
//  Created by libo on 2017/4/16.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class NetworkPool {
    private let connectionCount = 3
    private var connections = [NetworkConnection]()
    private let semaphore: DispatchSemaphore
    private let myQueue: DispatchQueue
    
    private init() {
        for _  in 0..<connectionCount {
            connections.append(NetworkConnection())
        }
        semaphore = DispatchSemaphore(value: connectionCount)
        myQueue = DispatchQueue(label: "networkPool")
    }
    
    private func doGetConnection() -> NetworkConnection? {
        var result: NetworkConnection?
        _ = semaphore.wait(timeout: .distantFuture)//解决竞争
        myQueue.sync {
            result = connections.remove(at: 0)
        }
        return result
    }
    
    private func doReturnConnections(connection: NetworkConnection) {
        myQueue.sync {//解决并发
            connections.append(connection)
            semaphore.signal()
        }
    }
    
    static let shareInstance = NetworkPool()
    
    class func getConnection() -> NetworkConnection? {
       return shareInstance.doGetConnection()
    }
    
    class func returnConnection(connect: NetworkConnection) {
        shareInstance.doReturnConnections(connection: connect)
    }
    
    
}
