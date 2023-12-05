//
//  CustomScene.swift
//  MiPrimerJuego
//
//  Created by Arturo Carretero Calvo on 4/12/23.
//

import SpriteKit
import GameplayKit

class CustomScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = .black

        guard let image = UIImage(named: "img_ship") else {
            return
        }
        let texture = SKTexture(image: image)
        let player = SKSpriteNode(texture: texture)
        let position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)

        player.position = position

        addChild(player)

        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false

        /**
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            player.removeFromParent()

            self.explosion("PlayerExplosion", in: player.position) {
                print("Has muerto.")
            }
        }*/
    }

    func touchDown(atPoint pos : CGPoint) {
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func update(_ currentTime: TimeInterval) {
    }

    // MARK: - Private

    private func explosion(_ texture: String, in position: CGPoint, completion: (() -> Void)? = nil) {
        let animatedAtlas = SKTextureAtlas(named: texture)
        let numImages = animatedAtlas.textureNames.count

        var frames: [SKTexture] = []

        for i in 1...numImages {
            let textureName = String(format: "texture_%d", i)

            frames.append(animatedAtlas.textureNamed(textureName))
        }

        var explosion = SKSpriteNode()

        let firstTexture = frames[0]

        explosion = SKSpriteNode(texture: firstTexture)
        explosion.position = position

        addChild(explosion)

        explosion.run(SKAction.animate(with: frames, timePerFrame: 0.1, resize: false, restore: true)) {
            explosion.removeFromParent()

            completion?()
        }
    }
}
