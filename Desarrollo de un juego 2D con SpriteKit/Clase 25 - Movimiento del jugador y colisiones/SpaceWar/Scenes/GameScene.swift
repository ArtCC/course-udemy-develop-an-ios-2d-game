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
    var joystickIsActive = false
    var selectedNodes: [UITouch: SKSpriteNode] = [:]
    var playerVelocityX: CGFloat = 0
    var playerVelocityY: CGFloat = 0

    let joystickBase = SKSpriteNode(imageNamed: Constants.Images.joystickBase)
    let joystick = SKSpriteNode(imageNamed: Constants.Images.joystick)
    let firePad = SKSpriteNode(imageNamed: Constants.Images.firePad)
    
    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayerControls()
        createPlayer()

        AddAsteroids()
        addEnemies()

        setupPhysics()
    }

    override func update(_ currentTime: TimeInterval) {
        if joystickIsActive {
            player.position = CGPointMake(player.position.x - (playerVelocityX * 3),
                                          player.position.y + (playerVelocityY * 3))
        }

        player.normalEnginePlayerIsHidden(joystickIsActive)
        player.turboEnginePlayerIsHidden(!joystickIsActive)
    }

    private func setupPhysics() {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self

        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRectMake(CGRectGetMinX(frame),
                                                             CGRectGetMinY(frame),
                                                             frame.size.width,
                                                             frame.size.height))
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
                SKAction.wait(forDuration: CGFloat.random(in: 2...4))
            ])))
    }
}
