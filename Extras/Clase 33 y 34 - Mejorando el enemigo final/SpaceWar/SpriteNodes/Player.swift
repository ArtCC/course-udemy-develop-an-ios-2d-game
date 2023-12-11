//
//  Player.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit

final class Player: SKSpriteNode {
    private var normalEnginePlayer = SKSpriteNode()
    private var turboEnginePlayer = SKSpriteNode()

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

    func normalEnginePlayerIsHidden(_ isHidden: Bool) {
        normalEnginePlayer.isHidden = isHidden
    }

    func turboEnginePlayerIsHidden(_ isHidden: Bool) {
        turboEnginePlayer.isHidden = isHidden
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
        normalEnginePlayer = SKSpriteNode(texture: firstFrameTexture)
        normalEnginePlayer.position = CGPoint(x: (-size.width / 2) - 10.0, y: 0.0)

        addChild(normalEnginePlayer)

        normalEnginePlayer.run(SKAction.repeatForever(
            SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))

        normalEnginePlayer.isHidden = true
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
        turboEnginePlayer = SKSpriteNode(texture: firstFrameTexture)
        turboEnginePlayer.position = CGPoint(x: (-size.width / 2) - 10.0, y: 0.0)

        addChild(turboEnginePlayer)

        turboEnginePlayer.run(SKAction.repeatForever(
            SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)))

        turboEnginePlayer.isHidden = true
    }

    func shot(completion: (SKSpriteNode) -> Void) {
        let texture = SKTexture(imageNamed: Constants.Images.playerShot)
        let shot = Shot(texture: texture,
                        position: CGPoint(x: self.position.x + 50, y: self.position.y),
                        direction: .leftToRight,
                        type: .player)

        shot.movement()

        self.parent?.addChild(shot)

        completion(shot)
    }

    private func setup(with position: CGPoint) {
        zPosition = 1

        self.position = position
    }
}
