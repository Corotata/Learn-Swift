//: Playground - noun: a place where people can play

import UIKit


//定义字典

let dict = ["name":"corotata","no":"101"]

//var dict1[String:Any] = ["name" : "yz", "age" : 20]

var dict1 : [String:Any] = [String : Any]()
var dict2 : [String:Any] = ["name" : "corotata", "no" : 101]

dict2["class"] = "ABC"

dict2.updateValue("DEF", forKey: "class")

dict2 .removeValue(forKey: "class")

dict2["class"]


for key in dict2.keys {
    print(key)
}

print("\n")
for value in dict2.values {
    print(value)
}

print("\n")
for (key,value) in dict2 {
    
    print("\(key):\(value)")
}
