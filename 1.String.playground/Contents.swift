//: Playground - noun: a place where people can play

import UIKit

/*:
 * note:
 * 字符串在任何的开发中的使用频率都非常高
 * `Objective-C` 和 `Swift`中字符串的区别
 * `Objective-C`中字符串类型为`NSString`,而`Swift`中字符串类型为`String`
 * `Objective-C`中字符串使用@"Hello world!",而`Swift`中则是"Hello world!"
 * `NSString`与`String`，由于`String`为结构体，所以性能更高
 * `Swift`开发中，`NSString`与`String`之间能无缝转换
 */

/*:
 **字符串的定义**
 */
import Foundation

let str:String = "Hello Swift"
let str2 = "Hello Swift2"
//str2 = "Hello"   //变量不能重新赋值

/*:
 **声明变量**
 */

var str4:String = "Hello Swift"
str4 = "123"

/*:
 **获取字符串的长度**
 */

let count = str.characters.count

/*:
 **字符串拼接**
 */

//字符串与字符串的拼接

let str5 = "Hello"
let str6 = "Swift"
let str7 = str5 + str6
//:---------------------------

let name = "HangMeiMei"
let age = 16
let desc = "I'm \(name),age is \(age)"

//:---------------------------
var str8 = "Hello"
str8 .append(str6)

//:---------------------------
var str9 = "Hello"
str9 += str6

//:---------------------------

/*:
 **字符串的截取**
 */

let urlString = "www.corotata.com"

let www = (urlString as NSString).substring(to: 3)
let corotata = (urlString as NSString).substring(with: NSRange(location: 4, length: 8))
let com = (urlString as NSString).substring(from: 13)

//:---------------------------


let wwwIndex = urlString.index(urlString.startIndex, offsetBy: 3)
let www2 = urlString.substring(to: wwwIndex)


let startIndex = urlString.index(urlString.startIndex, offsetBy: 4)
let endIndex = urlString.index(urlString.endIndex, offsetBy: -4)
let corotata2 = urlString.substring(with: Range(startIndex..<endIndex))

let comIndex = urlString.index(urlString.endIndex, offsetBy: -3)
let com2 = urlString.substring(from: comIndex)
