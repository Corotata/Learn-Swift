//: Playground - noun: a place where people can play

import UIKit


//定义数组
let array : [Any] = ["Corotata",101,1.88]
var arrayM = [Any]()

//往数组里面添加内容
arrayM.append("Hello")
arrayM.append("Swift,")
arrayM.append(3.0)


//修改数组里面的内容
arrayM[1] = "234234"

//从数组里面查询内容
arrayM[1]

//f遍历数组
for item in arrayM[0...1] {
    print(item)
}

print("\n")

for item in arrayM {
    print(item)
}

print("\n")

for(index,content) in arrayM.enumerated() {
    print("index:\(index),\(content)")
}


//从数组里面移除内容
arrayM.remove(at: 0)
arrayM.removeFirst()
arrayM.removeLast()
arrayM.removeAll()


//数组合并

var array2 = ["xiaoming","xiaohong","xiaoqing"]
var array3 = ["xiaogan","xiaoxue"]
var array4 = array2 + array3
print(array4)


var array5 = ["xiaogan", 18, 1.88] as [Any]
var array6 = ["xiaohong", 13,1.55] as [Any]
print(array5 +  array6)
