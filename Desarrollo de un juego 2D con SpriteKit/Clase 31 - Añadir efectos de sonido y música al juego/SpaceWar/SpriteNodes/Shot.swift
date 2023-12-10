//
//  Shot.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 9/12/23.
//

import SpriteKit

enum ShotDirection {
    case rightToLeft
    case leftToRight
}

enum SpriteType {
    case enemy
    case player
}

final class Shot: SKSpriteNode {
    private var shotDirection: ShotDirection = .leftToRight

    init(texture: SKTexture, position: CGPoint, direction: ShotDirection, type: SpriteType) {
        super.init(texture: texture, color: .clear, size: texture.size())

        setup(texture, position, direction, type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func movement() {
        let direction = CGVector(dx: shotDirection == .leftToRight ? 1.0 : -1.0, dy: 0.0)
        let distance: CGFloat = 750
        let action = SKAction.moveBy(x: direction.dx * distance, y: direction.dy * distance, duration: 1.0)
        let remove = SKAction.removeFromParent()

        run(SKAction.sequence([action, remove]))
    }

    private func setup(_ texture: SKTexture, _ position: CGPoint, _ direction: ShotDirection, _ type: SpriteType) {
        zPosition = 1

        self.position = position
        self.texture = texture
        self.shotDirection = direction

        setScale(2.0)

        switch type {
        case .enemy:
            physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
            physicsBody?.categoryBitMask = PhysicsCategory.enemyProjectile
            physicsBody?.contactTestBitMask = PhysicsCategory.player
            physicsBody?.collisionBitMask = PhysicsCategory.none
        case .player:
            physicsBody = SKPhysicsBody(rectangleOf: size)
            physicsBody?.categoryBitMask = PhysicsCategory.playerProjectile
            physicsBody?.contactTestBitMask = PhysicsCategory.enemy
            physicsBody?.collisionBitMask = PhysicsCategory.none
        }

        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = true

        run(SKAction.playSoundFileNamed(Constants.Music.shot, waitForCompletion: false))
    }
}
