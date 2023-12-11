//
//  GameScene.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit
import GameplayKit

final class GameScene: ParentScene {
    private struct SceneTraits {
        // Duration
        static let animation: CGFloat = 0.25

        // Score
        static let scoreForBoss: Int = Int.random(in: 10...15)
    }

    var player = Player()
    var joystickIsActive = false
    var selectedNodes: [UITouch: SKSpriteNode] = [:]
    var playerVelocityX: CGFloat = 0
    var playerVelocityY: CGFloat = 0
    var enemiesDestroyed: Int = 0 {
        didSet {
            ScoreManager.saveScore(enemiesDestroyed)

            scoreLabel.text = String(format: NSLocalizedString("score.text", comment: ""), String(ScoreManager.getScore()))

            if enemiesDestroyed >= SceneTraits.scoreForBoss {
                createFinalBoss()
            }
        }
    }
    var boss = Boss()
    var bossIsCreate = false

    let joystickBase = SKSpriteNode(imageNamed: Constants.Images.joystickBase)
    let joystick = SKSpriteNode(imageNamed: Constants.Images.joystick)
    let firePad = SKSpriteNode(imageNamed: Constants.Images.firePad)
    
    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayerControls()
        createPlayer()
        createScoreLabel()
        createMusicGame()

        addAsteroids()
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

    func endGame(isWin: Bool) {
        let transition = SKTransition.crossFade(withDuration: SceneTraits.animation)
        let gameOverScene = GameOverScene(size: self.size, win: isWin)

        view?.presentScene(gameOverScene, transition: transition)
    }

    private func setupPhysics() {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self

        physicsBody = SKPhysicsBody(edgeLoopFrom: CGRectMake(CGRectGetMinX(frame),
                                                             CGRectGetMinY(frame),
                                                             frame.size.width,
                                                             frame.size.height))
    }

    private func addAsteroids() {
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
