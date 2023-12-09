//
//  PhysicsCategory.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 9/12/23.
//

import Foundation

struct PhysicsCategory {
    static let all: UInt32 = UInt32.max
    static let none: UInt32 = 0
    static let enemy: UInt32 = 0b1
    static let enemyProjectile: UInt32 = 0b11
    static let player: UInt32 = 0b100
    static let playerProjectile: UInt32 = 0b101
}
