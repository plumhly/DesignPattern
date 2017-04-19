//
//  Utils.swift
//  SportsStores
//
//  Created by libo on 2017/4/6.
//  Copyright © 2017年 libo. All rights reserved.
//

import UIKit

class Utils {
    static func currencyStringFromNumber(_ number: NSNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: number) ?? ""
    }
}
