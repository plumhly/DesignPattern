//
//  main.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Foundation

print("Hello, World!")

//let car = Car(carType: .SPORTS, floor: ShortFloorplan(), suspension: RaceSuspension(), drive: RearWheelDrive())
//car.printDetails()

let factory = CarFactory.getFactory(car: .SPORTS)

if factory != nil {
//    let car = Car(carType: .SPORTS, floor: factory!.createFloorplan(), suspension: factory!.createSuspension(), drive: factory!.createDriveTrain())
    let car = Car(carType: .SPORTS)
    car.printDetails()
}
