//
//  Logger.swift
//  Singleton
//
//  Created by libo on 2017/4/9.
//  Copyright © 2017年 libo. All rights reserved.
//

import Cocoa


let globalLooger = Logger()

final class Logger {

    private let myQueue = DispatchQueue(label: "logger")
    private var data = [String]()
    
    fileprivate init(){}
    
    func log(msg: String) {
        myQueue.sync {
           data.append(msg) 
        }
        
    }
    
    func printLog() {
        for mes in data {
            print("Message: \(mes) \n")
        }
    }
}
