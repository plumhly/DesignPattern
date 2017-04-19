//: Playground - noun: a place where people can play

import UIKit

class LogItem {
    var from: String?
    @NSCopying var data: NSArray?
}

var dataArray = NSMutableArray(array: [1,2,3,4])
var lItem = LogItem()
lItem.from = "libo"
lItem.data = dataArray

dataArray[0] = 10

//lItem.data?[1] = 200 //这里将报错，因为调用copy,返回的是immutable
print("\(lItem.data![0])")