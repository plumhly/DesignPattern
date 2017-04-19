//: Playground - noun: a place where people can play

import UIKit

class Message: NSObject, NSCopying {
    var to: String
    var subject: String
    
    init(to: String, subject: String) {
        self.to = to
        self.subject = subject
    }
    //round 4
    func copy(with zone: NSZone? = nil) -> Any {
        return Message(to: self.to, subject: self.subject)
    }
}

// round 3

class DetailMessage: Message {
    var from: String
    
    init(to: String, subject: String, from: String) {
        self.from = from
        super.init(to: to, subject: subject)
    }
    
    //round 4
    override func copy(with zone: NSZone?) -> Any {
        return DetailMessage(to: self.to, subject: self.subject, from: self.from)
    }
}

class MessageLogger {
    var messages: [Message] = []
    func logMessage(msg: Message) {
        // round 1
        /*self.messages.append(msg)*/
        
        // round 2
        /*
        self.messages.append(Message(to: msg.to, subject: msg.subject))
        */
        
        //round 4
        messages.append(msg.copy() as! Message)
        /*
        if msg is DetailMessage {
            messages.append((msg as NSObject).copy() as! DetailMessage)
        } else {
            messages.append((msg as NSObject).copy() as! Message)//第一个as 向上转型。 as! 向下转型
        }
         */
    }
    
    func processMessages(callBack: (Message) -> Void) {
        for msg in messages {
            callBack(msg)
        }
    }
    
}

do {
    var logger = MessageLogger()
    var mes = Message(to: "Bob", subject: "hillo")
    logger.logMessage(msg: mes)
    
    mes.to = "libo"
    mes.subject = "good luck"
    
    logger.logMessage(msg: mes)
    
    logger.processMessages() {
        msg in
        print("to: \(msg.to) subject: \(msg.subject)")
    }

}



do {
    print("**********round 3************")
    var logger = MessageLogger()
    var mes = Message(to: "Bob", subject: "hillo")
    logger.logMessage(msg: mes)
    
    mes.to = "libo"
    mes.subject = "good luck"
    
    logger.logMessage(msg: mes)
    
    logger.logMessage(msg: DetailMessage(to: "plum", subject: "miss you", from: "libo"))
    
    logger.processMessages() {
        msg in
        
        if let ms = msg as? DetailMessage {
            print("Detail Message: to \(ms.to) From: \(ms.from) subject: \(ms.subject)")
        } else {
            print("to: \(msg.to) subject: \(msg.subject)")
        }
        
        
    }
}



