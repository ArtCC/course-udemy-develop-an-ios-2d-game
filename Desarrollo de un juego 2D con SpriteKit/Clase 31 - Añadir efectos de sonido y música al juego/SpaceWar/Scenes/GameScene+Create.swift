//
//  GameScene+Create.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit

extension GameScene {
    func createParallaxBackground() {
        let texture = SKTexture(imageNamed: Constants.Images.backgroundGame)

        for i in 0...3 {
            let position = CGPoint(x: (texture.size().width * CGFloat(i) - CGFloat(1 * 3)), y: 0.0)
            let background = Background(texture: texture, size: texture.size(), position: position, alpha: 1.0)
            background.anchorPoint = .zero

            addChild(background)

            background.movement()
        }
    }

    func createPlayerControls() {
        joystickBase.name = Nodes.joystickBase.rawValue
        joystickBase.position = CGPoint(x: joystickBase.size.width / 4 + 50, y: joystickBase.size.height / 4)
        joystickBase.zPosition = 5
        joystickBase.alpha = 0.2
        joystickBase.setScale(0.3)

        joystick.name = Nodes.joystick.rawValue
        joystick.position = joystickBase.position
        joystick.zPosition = 6
        joystick.alpha = 0.5
        joystick.setScale(0.2)

        firePad.name = Nodes.firePad.rawValue
        firePad.position = CGPoint(x: size.width - 75, y: joystick.position.y)
        firePad.zPosition = 6
        firePad.alpha = 0.5
        firePad.setScale(0.2)

        addChild(joystickBase)
        addChild(joystick)
        addChild(firePad)
    }

    func createPlayer() {
        let texture = SKTexture(imageNamed: Constants.Images.player)
        let position = CGPoint(x: -size.width * 0.15, y: size.height * 0.5)

        player = Player(texture: texture, size: texture.size(), position: position)
        player.name = Nodes.player.rawValue

        player.addNormalEngineFire(with: Constants.Textures.playerNormalFire)
        player.addTurboEngineFire(with: Constants.Textures.playerTurboFire)

        addChild(player)

        let moveDistance = CGFloat(275)
        let duration = TimeInterval(2)
        let moveAction = SKAction.moveBy(x: moveDistance, y: 0, duration: duration)

        player.run(moveAction) {
            self.player.physicsBody = SKPhysicsBody(rectangleOf: self.player.size)
            self.player.physicsBody?.isDynamic = true
            self.player.physicsBody?.categoryBitMask = PhysicsCategory.player
            self.player.physicsBody?.contactTestBitMask = PhysicsCategory.enemy
            self.player.physicsBody?.collisionBitMask = PhysicsCategory.all
            self.player.physicsBody?.usesPreciseCollisionDetection = true
        }
    }

    func createAsteroid() {
        let texture = SKTexture(imageNamed: Constants.Images.asteroid)
        let actualY = CGFloat.random(in: texture.size().height / 2...size.height - texture.size().height / 2)
        let position = CGPoint(x: size.width + texture.size().width / 2, y: actualY)

        let asteroid = Asteroid(texture: texture, position: position)
        asteroid.name = Nodes.asteroid.rawValue

        addChild(asteroid)
    }

    func createEnemy() {
        let texture = SKTexture(imageNamed: Constants.Images.enemy)
        let enemy = Enemy(texture: texture)
        let randomY = CGFloat.random(in: enemy.size.height / 2...size.height - enemy.size.height / 2)

        enemy.name = Nodes.enemy.rawValue
        enemy.position = CGPoint(x: size.width + (enemy.size.width * 2), y: randomY)

        enemy.addEngineFire(with: Constants.Textures.enemyTurbo)
        enemy.movement()
        enemy.shot()

        addChild(enemy)
    }

    func createFinalBoss() {
        if !bossIsCreate {
            bossIsCreate = true

            let texture = SKTexture(imageNamed: Constants.Images.boss)
            let enemy = Boss(texture: texture)
            enemy.name = Nodes.boss.rawValue

            let randomY = CGFloat.random(in: enemy.size.height / 2...size.height - enemy.size.height / 2)
            enemy.position = CGPoint(x: size.width + enemy.size.width / 2, y: randomY)
            enemy.setScale(1.5)

            enemy.addEngineFire(with: Constants.Textures.bossTurboEngine)
            enemy.movement()
            enemy.shot()

            addChild(enemy)
        }
    }

    func createMusicGame() {
        let music = SKAudioNode(fileNamed: Constants.Music.game)
        music.autoplayLooped = true
        music.isPositional = false

        addChild(music)

        music.run(SKAction.play())
    }
}
