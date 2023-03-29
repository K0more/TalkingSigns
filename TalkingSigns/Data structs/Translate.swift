//
//  Translate.swift
//  TalkingSigns
//
//  Created by Archit Khanna on 16/03/23.
//

import Foundation

struct Translate: Codable{
    var userTextInput:String
    var inputDate:Date
    var itemIdentifier:UUID
    
    
    func saveInput(){
        dataManager.save(self, with: itemIdentifier.uuidString)

    }
    
    func toString() -> String {
        var output = ""
        output += self.userTextInput + "\n"
        output += self.inputDate.description + "\n"
        output += "itemIdentifier : " + self.itemIdentifier.uuidString + "\n"
        
        return output
    }
}

    
//struct Word{
//
//
//    class Attributes{
//        var id:Int = 0
//        var text:String = ""
//        var animationIndex:Int = 0
//    }
//
//    class Relationship{
//
//    }
//}
//
//struct Animation{
//    class animationAttributes{
//        var animationId:Int
//        var  filePath:Int
//    }
//}
