//
//  main.swift
//  ConditionalStructures
//
//  Created by Arturo Carretero Calvo on 30/11/23.
//

import Foundation

// Conditional structures

var isPremium = false
if isPremium {
    print("El usuario es premium")
} else {
    print("El usuario NO es premium")
}

var score = 24
if score < 10 {
    print("Tienes una puntuación muy baja")
} else if score > 10 && score < 25 {
    print("Tienes una puntuación media")
} else {
    print("Tienes una puntuación máxima")
}

let name = "Arturo"

switch name {
case "Bruce":
    print("Te llamas como Batman")
case "Arturo":
    print("Tu nombre coincide con el mío")
default:
    print("Tu nombre no coincide")
}
