//: Playground - noun: a place where people can play

import UIKit

struct Appointment {
    var name: String
    var day: String
    var place: String
    
    func printDetails(label: String) {
        print("\(label) with \(name) on \(day) at \(place)")
    }
}

var peerMeeting = Appointment(name: "Bob", day: "Mon", place: "Joe's Bar")
var workMeeting = peerMeeting
workMeeting.name = "Alice"
workMeeting.day = "Fri"
workMeeting.place = "Conference Rm 2"

peerMeeting.printDetails(label: "social")
workMeeting.printDetails(label: "work")