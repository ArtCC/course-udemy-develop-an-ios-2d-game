//
//  Enemy.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit

final class Enemy: SKSpriteNode {
    init() {
        super.init(texture: nil, color: .clear, size: .zero)
    }

    init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())

        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func movement() {
        let duration = CGFloat.random(in: 3...6)
        let moveAction = SKAction.moveTo(x: -size.width / 2, duration: duration)
        let removeAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([moveAction, removeAction])

        run(sequence)
    }

    private func setup() {
        zPosition = 1
    }
}
