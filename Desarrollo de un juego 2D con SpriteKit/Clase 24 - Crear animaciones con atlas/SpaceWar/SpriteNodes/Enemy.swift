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

    func addEngineFire(with texture: String) {
        let animatedAtlas = SKTextureAtlas(named: texture)
        let numImages = animatedAtlas.textureNames.count

        var frames: [SKTexture] = []

        for i in 1...numImages {
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(animatedAtlas.textureNamed(textureName))
        }

        let firstFrameTexture = frames[0]
        let turboEnemy = SKSpriteNode(texture: firstFrameTexture)
        turboEnemy.position = CGPoint(x: (size.width / 2) + 5.0, y: 0.0)

        addChild(turboEnemy)

        turboEnemy.run(SKAction.repeatForever(
            SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))
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
