//: Playground - noun: a place where people can play

import UIKit

//Tuple

let error = (404,"No Found")
print(error)
print(error.0)
print(error.1)

let error2 = (errorCode:404,content:"No Found")

print(error2.errorCode)
print(error2.content)
