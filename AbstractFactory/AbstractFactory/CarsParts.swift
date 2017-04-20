//
//  CarsParts.swift
//  AbstractFactory
//
//  Created by sigma-td on 2017/4/20.
//  Copyright © 2017年 sigma-td. All rights reserved.
//

import Foundation

enum Cars: String {
    case COPACT = "VW Golf"
    case SPORTS = "Porsche Boxter"
    case SUV = "Cadillac Escalade"
}

struct Car {
    var carType: Cars
    var floor: Floorplan
    var suspension: Suspension
    var drive: DriveTrain
    
    init(carType: Cars) {
        let concreteFactory = CarFactory.getFactory(car: carType)
        self.floor = concreteFactory!.createFloorplan()
        self.suspension = concreteFactory!.createSuspension()
        self.drive = concreteFactory!.createDriveTrain()
        self.carType = carType
    }
    
    func printDetails() {
        print("Car type: \(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine: \(floor.enginePosition.rawValue)")
        print("Suspemtion: \(suspension.suspensionType.rawValue)")
        print("Drive: \(drive.driveType.rawValue)")
    }
}
