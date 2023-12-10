//
//  Player.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit

final class Player: SKSpriteNode {
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
    }

    init(texture: SKTexture, size: CGSize, position: CGPoint) {
        super.init(texture: texture, color: .clear, size: size)

        setup(with: position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(with position: CGPoint) {
        zPosition = 1

        self.position = position
    }
}
