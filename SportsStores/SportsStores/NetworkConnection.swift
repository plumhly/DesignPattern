//
//  NetworkConnection.swift
//  SportsStores
//
//  Created by libo on 2017/4/16.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class NetworkConnection {
    private let stockData = [
        "Kayak" : 10, "Lifejacket": 14, "Soccer Ball": 32,"Corner Flags": 1, "Stadium": 4, "Thinking Cap": 8, "Unsteady Chair": 3, "Human Chess Board": 2, "Bling-Bling King":4 ]
    
    func getStockLevel(name: String) -> Int? {
        Thread.sleep(forTimeInterval: TimeInterval(arc4random()%2))
        return stockData[name]
    }

}
