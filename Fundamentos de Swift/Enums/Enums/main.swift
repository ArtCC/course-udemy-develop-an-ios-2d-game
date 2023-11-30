//
//  main.swift
//  Enums
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import Foundation

enum CompassPoint: String {
    case north = "Norte"
    case south = "Sur"
    case east = "Este"
    case west = "Oeste"
}

let compass = CompassPoint.north.rawValue

print(compass)

enum Barcode {
    case upc(Int, Int)
    case qrCode(String)
}

let code1 = Barcode.upc(5, 6)
let code2 = Barcode.qrCode("Ok")

print(code1)
print(code2)
