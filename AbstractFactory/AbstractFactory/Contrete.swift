//
//  Contrete.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Cocoa

class CompactCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return StandardFloorplan()
    }
    
    override func createDriveTrain() -> DriveTrain {
        return FrontWheelDrive()
    }
    
    override func createSuspension() -> Suspension {
        return RoadSuspension()
    }
}


class SportsCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return ShortFloorplan()
    }
    
    override func createDriveTrain() -> DriveTrain {
        return RearWheelDrive()
    }
    
    override func createSuspension() -> Suspension {
        return RaceSuspension()
    }
}


class SUVCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return LongFloorplan()
    }
    
    override func createDriveTrain() -> DriveTrain {
        return AllWheelDrive()
    }
    
    override func createSuspension() -> Suspension {
        return OffRoadSuspension()
    }
}

