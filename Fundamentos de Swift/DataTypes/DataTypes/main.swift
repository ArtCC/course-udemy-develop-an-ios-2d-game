//
//  main.swift
//  DataTypes
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import Foundation

// Int
let positiveInt = 156
print(positiveInt)

let negativeInt = -156
print(negativeInt)

// UInt8
let onlyPositiveInt: UInt8 = 255
print(onlyPositiveInt)

// Float
let positiveFloat: Float = 5.678
print(positiveFloat)

let negativeFloat: Float = -5.678
print(negativeFloat)

// Double
let positiveDouble: Double = 5.123456789
print(positiveDouble)

let negativeDouble: Double = -5.123456789
print(negativeDouble)

// Bool
let trueBool = true
print(trueBool)

let falseBool = false
print(falseBool)

// String
let name1 = "Arturo tiene: \(positiveInt) limones".capitalized
print(name1)

// Optionals
var name2: String?
print("\(String(describing: name2))")

name2 = "Bruce"

if let name2 {
    print(name2)
} else {
    print("No tiene valor")
}

// Array
let collection1: [String] = ["Uno", "Dos", "Tres", "Tres"]
print(collection1[2])

let collection2: [[String]] = [["Uno", "Dos", "Tres", "4"], ["Uno", "Dos", "Tres", "4"]]
print(collection2)

// Set
var numbers: Set<Int> = [1, 2, 3, 4, 5]
print(numbers)

numbers.insert(6)
print(numbers)

numbers.insert(3)
print(numbers)

// Dictionary
var ages: [String: Int] = ["Arturo": 42,
                           "Pedro": 41,
                           "Laura": 34]
print(ages)

for (name, age) in ages {
    if age == 42 {
        print("\(name) tiene \(age) años.")
    }
}

// Tuples
let tuple: (String, Bool) = ("is premium", false)
print(tuple)

print(tuple.0)
print(tuple.1)

let tuple2: (name: String, isPremium: Bool) = ("Arturo", false)
print(tuple2.isPremium)
