//
//  Drivetrains.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Foundation

protocol DriveTrain {
    var driveType: DriveOption {get}
}

enum DriveOption: String {
    case FRONT = "Front"
    case REAR = "Rear"
    case ALL = "4WD"
}

class FrontWheelDrive: DriveTrain {
    var driveType: DriveOption = .FRONT
}

class RearWheelDrive: DriveTrain {
    var driveType: DriveOption = .REAR
}

class AllWheelDrive: DriveTrain {
    var driveType: DriveOption = .ALL
}
