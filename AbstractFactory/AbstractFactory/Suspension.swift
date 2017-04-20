//
//  Suspension.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Cocoa

protocol Suspension {
    var suspensionType: SuspensionType {get}
}

enum SuspensionType: String {
    case STANDARD = "Stamdard"
    case SPORTS = "Firm"
    case SOFT = "Soft"
}

class RoadSuspension: Suspension {
    var suspensionType: SuspensionType = .STANDARD
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionType = .SOFT
}

class RaceSuspension: Suspension {
    var suspensionType: SuspensionType = .SPORTS
}
