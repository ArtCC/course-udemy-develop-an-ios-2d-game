//
//  main.swift
//  Loops
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import Foundation

// Loops
let array = [1,2,3,4,5,6,7,8,9]

for entero in array {
    if entero == 5 {
        continue
    }
    print("Número: \(entero)")
}

array.forEach { entero in
    print("Número: \(entero)")
}

var valor = 0
while valor < 10 {
    print("Número: \(valor)")
    valor += 1
}

var valor1 = 0
repeat {
    print("Número: \(valor1)")
    valor1 += 1
} while valor1 < 5
