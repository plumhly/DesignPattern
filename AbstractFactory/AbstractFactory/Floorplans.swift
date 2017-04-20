//
//  Floorplans.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Cocoa

protocol Floorplan {
    var seats: Int {get}
    var enginePosition: EngineOption {get}
}

enum EngineOption: String {
    case FRONT = "Front"
    case MID = "Mid"
}

class ShortFloorplan: Floorplan {
    var seats: Int = 2
    var enginePosition: EngineOption = .MID
}

class StandardFloorplan: Floorplan {
    var seats: Int = 4
    var enginePosition: EngineOption = .FRONT
}

class LongFloorplan: Floorplan {
    var seats: Int = 8
    var enginePosition: EngineOption = .FRONT
}
