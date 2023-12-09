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

    func addNormalEngineFire(with texture: String) {
        let animatedAtlas = SKTextureAtlas(named: texture)
        let numImages = animatedAtlas.textureNames.count

        var frames: [SKTexture] = []

        for i in 1...numImages {
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(animatedAtlas.textureNamed(textureName))
        }

        let firstFrameTexture = frames[0]
        let normalPlayer = SKSpriteNode(texture: firstFrameTexture)
        normalPlayer.position = CGPoint(x: (-size.width / 2) - 10.0, y: 0.0)

        addChild(normalPlayer)

        normalPlayer.run(SKAction.repeatForever(
            SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))
    }

    func addTurboEngineFire(with texture: String) {
        let animatedAtlas = SKTextureAtlas(named: texture)
        let numImages = animatedAtlas.textureNames.count

        var frames: [SKTexture] = []

        for i in 1...numImages {
            let textureName = String(format: Constants.Textures.texture, i)
            frames.append(animatedAtlas.textureNamed(textureName))
        }

        let firstFrameTexture = frames[0]
        let normalPlayer = SKSpriteNode(texture: firstFrameTexture)
        normalPlayer.position = CGPoint(x: (-size.width / 2) - 10.0, y: 0.0)

        addChild(normalPlayer)

        normalPlayer.run(SKAction.repeatForever(
            SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))
    }

    private func setup(with position: CGPoint) {
        zPosition = 1

        self.position = position
    }
}
