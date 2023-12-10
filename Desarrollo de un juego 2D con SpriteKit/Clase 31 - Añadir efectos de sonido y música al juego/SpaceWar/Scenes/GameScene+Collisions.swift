//
//  GameScene+Collisions.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 9/12/23.
//

import SpriteKit

extension GameScene {
    func enemyDidCollideWithPlayerShot(_ enemy: SKSpriteNode, _ playerProjectile: SKSpriteNode) {
        playerShotAndEnemy(enemy, playerProjectile)
    }
    
    func playerShotDidCollideWithEnemy(_ playerProjectile: SKSpriteNode, _ enemy: SKSpriteNode) {
        playerShotAndEnemy(enemy, playerProjectile)
    }
    
    func enemyDidCollideWithPlayer(_ enemy: SKSpriteNode, _ player: SKSpriteNode) {
        enemyAndPlayer(enemy, player)
    }

    func playerDidCollideWithEnemy(_ player: SKSpriteNode, _ enemy: SKSpriteNode) {
        enemyAndPlayer(enemy, player)
    }
    
    func playerDidCollideWithEnemyShot(_ player: SKSpriteNode, _ enemyProjectile: SKSpriteNode) {
        playerAndEnemyShot(player, enemyProjectile)
    }

    func enemyShotDidCollideWithPlayer(_ enemyProjectile: SKSpriteNode, _ player: SKSpriteNode) {
        playerAndEnemyShot(player, enemyProjectile)
    }

    fileprivate func playerShotAndEnemy(_ enemy: SKSpriteNode, _ playerProjectile: SKSpriteNode) {
        let explosion = Explosion(size: enemy.size)

        switch enemy.name {
        case Nodes.asteroid.rawValue:
            enemiesDestroyed += 1

            explosion.explosion(texture: Constants.Textures.explosion, 
                                music: Constants.Music.enemyExplosion,
                                in: enemy.position)
        case Nodes.boss.rawValue:
            enemiesDestroyed += 5

            explosion.explosion(texture: Constants.Textures.bossExplosion, 
                                music: Constants.Music.enemyExplosion,
                                in: enemy.position) {
                self.endGame(isWin: true)
            }
        case Nodes.enemy.rawValue:
            enemiesDestroyed += 2

            explosion.explosion(texture: Constants.Textures.enemyExplosion, 
                                music: Constants.Music.enemyExplosion,
                                in: enemy.position)
        default:
            break
        }

        addChild(explosion)

        enemy.removeFromParent()
        playerProjectile.removeFromParent()
    }

    fileprivate func enemyAndPlayer(_ enemy: SKSpriteNode, _ player: SKSpriteNode) {
        let enemyExplosion = Explosion(size: enemy.size)

        switch enemy.name {
        case Nodes.asteroid.rawValue:
            enemyExplosion.explosion(texture: Constants.Textures.explosion,
                                     music: Constants.Music.enemyExplosion,
                                     in: enemy.position)
        case Nodes.boss.rawValue:
            enemyExplosion.explosion(texture: Constants.Textures.bossExplosion,
                                     music: Constants.Music.enemyExplosion,
                                     in: enemy.position)
        case Nodes.enemy.rawValue:
            enemyExplosion.explosion(texture: Constants.Textures.enemyExplosion,
                                     music: Constants.Music.enemyExplosion,
                                     in: enemy.position)
        default:
            break
        }

        let playerExplosion = Explosion(size: player.size)
        playerExplosion.explosion(texture: Constants.Textures.playerExplosion, 
                                  music: Constants.Music.playerExplosion,
                                  in: player.position) {
            self.endGame(isWin: false)
        }

        addChild(enemyExplosion)
        addChild(playerExplosion)

        enemy.removeFromParent()
        player.removeFromParent()
    }

    fileprivate func playerAndEnemyShot(_ player: SKSpriteNode, _ enemyProjectile: SKSpriteNode) {
        let explosion = Explosion(size: player.size)
        explosion.explosion(texture: Constants.Textures.playerExplosion, 
                            music: Constants.Music.playerExplosion,
                            in: player.position) {
            self.endGame(isWin: false)
        }

        addChild(explosion)

        player.removeFromParent()
        enemyProjectile.removeFromParent()
    }
}
