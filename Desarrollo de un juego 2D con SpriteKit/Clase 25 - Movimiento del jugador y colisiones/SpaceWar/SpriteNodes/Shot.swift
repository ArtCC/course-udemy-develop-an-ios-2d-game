//
//  Shot.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 9/12/23.
//

import SpriteKit

enum MovementShotType {
    case rightToLeft
    case leftToRight
}

final class Shot: SKSpriteNode {
    private var type: MovementShotType = .leftToRight

    init(texture: SKTexture, position: CGPoint, type: MovementShotType) {
        super.init(texture: texture, color: .clear, size: texture.size())

        setup(texture, position, type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func movement() {
        let direction = CGVector(dx: type == .leftToRight ? 1.0 : -1.0, dy: 0.0)
        let distance: CGFloat = 750
        let action = SKAction.moveBy(x: direction.dx * distance, y: direction.dy * distance, duration: 1.0)
        let remove = SKAction.removeFromParent()

        run(SKAction.sequence([action, remove]))
    }

    private func setup(_ texture: SKTexture, _ position: CGPoint, _ type: MovementShotType) {
        zPosition = 1

        self.position = position
        self.texture = texture
        self.type = type

        setScale(2.0)
    }
}
