//
//  Abstract.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Cocoa

class CarFactory {
    func createFloorplan() -> Floorplan {
        fatalError("not implement")
    }
    
    func createSuspension() -> Suspension {
        fatalError("not implement")
    }
    
    func createDriveTrain() -> DriveTrain {
        fatalError("not implement")
    }
    
    final class func getFactory(car: Cars) -> CarFactory? {
        var factory: CarFactory?
        switch car {
        case .COPACT:
            factory = CompactCarFactory()
            
        case .SPORTS:
            factory = SportsCarFactory()
            
        case .SUV:
            factory = SUVCarFactory()
        }
        return factory
    }
}
