//
//  CGPoint.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 11/12/23.
//

import Foundation

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        sqrt((x - point.x) * (x - point.x) + (y - point.y) * (y - point.y))
    }
}
