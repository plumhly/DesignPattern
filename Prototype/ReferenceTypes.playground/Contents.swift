//: Playground - noun: a place where people can play

import UIKit


class Appointment: NSObject, NSCopying {
    var name: String
    var day: String
    var place: String
    
    func printDetail(_ label: String) {
        print("\(label) with \(name) on \(day) at \(place)")
    }
    
    init(name: String, day: String, place: String) {
//        super.init()
        self.name = name
        self.day = day
        self.place = place
    }
    // round 2
    func copy(with zone: NSZone? = nil) -> Any {
        return Appointment(name: self.name, day: self.day, place: self.place)
    }
}

/* round1
var peerMeeting = Appointment.init(name: "Bob", day: "Mon", place: "Joe's Bar")
let workMeeting = peerMeeting
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

peerMeeting.printDetail("social")
workMeeting.printDetail("work")
*/

//round 2
var peerMeeting = Appointment.init(name: "Bob", day: "Mon", place: "Joe's Bar")
let workMeeting = peerMeeting.copy() as! Appointment
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

peerMeeting.printDetail("social")
workMeeting.printDetail("work")