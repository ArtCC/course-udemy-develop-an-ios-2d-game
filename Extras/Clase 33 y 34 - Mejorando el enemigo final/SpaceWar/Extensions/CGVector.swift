//
//  CGVector.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 11/12/23.
//

import Foundation

extension CGVector {
    func normalized() -> CGVector {
        let length = sqrt(dx * dx + dy * dy)
        
        return CGVector(dx: dx / length, dy: dy / length)
    }
}
