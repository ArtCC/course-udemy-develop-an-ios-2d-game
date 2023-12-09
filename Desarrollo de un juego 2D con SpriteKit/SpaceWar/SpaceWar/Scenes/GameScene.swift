//
//  GameScene.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit
import GameplayKit

final class GameScene: SKScene {
    var player = Player()

    let joystickBase = SKSpriteNode(imageNamed: Constants.Images.joystickBase)
    let joystick = SKSpriteNode(imageNamed: Constants.Images.joystick)
    let firePad = SKSpriteNode(imageNamed: Constants.Images.firePad)

    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayerControls()
        createPlayer()

        AddAsteroids()
        addEnemies()
    }

    override func update(_ currentTime: TimeInterval) {
    }

    private func AddAsteroids() {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(createAsteroid),
                SKAction.wait(forDuration: CGFloat.random(in: 3...5))
            ])))
    }

    private func addEnemies() {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(createEnemy),
                SKAction.wait(forDuration: CGFloat.random(in: 1.5...3.0))
            ])))
    }
}
