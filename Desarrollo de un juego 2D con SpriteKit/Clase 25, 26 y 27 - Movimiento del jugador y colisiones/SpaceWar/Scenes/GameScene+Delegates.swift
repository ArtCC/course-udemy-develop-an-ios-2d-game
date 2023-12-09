//
//  GameScene+Delegates.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 9/12/23.
//

import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB

        if firstBody.categoryBitMask == PhysicsCategory.enemy && secondBody.categoryBitMask == PhysicsCategory.playerProjectile {
            if let enemy = firstBody.node as? SKSpriteNode,
               let playerProjectile = secondBody.node as? SKSpriteNode {
                enemyDidCollideWithPlayerShot(enemy, playerProjectile)
            }
        }

        if firstBody.categoryBitMask == PhysicsCategory.playerProjectile && secondBody.categoryBitMask == PhysicsCategory.enemy {
            if let playerProjectile = firstBody.node as? SKSpriteNode,
               let enemy = secondBody.node as? SKSpriteNode {
                playerShotDidCollideWithEnemy(playerProjectile, enemy)
            }
        }

        if firstBody.categoryBitMask == PhysicsCategory.enemy && secondBody.categoryBitMask == PhysicsCategory.player {
            if let enemy = firstBody.node as? SKSpriteNode,
               let player = secondBody.node as? SKSpriteNode {
                enemyDidCollideWithPlayer(enemy, player)
            }
        }

        if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemy {
            if let player = firstBody.node as? SKSpriteNode,
               let enemy = secondBody.node as? SKSpriteNode {
                playerDidCollideWithEnemy(player, enemy)
            }
        }

        if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemyProjectile {
            if let player = firstBody.node as? SKSpriteNode,
               let enemyProjectile = secondBody.node as? SKSpriteNode {
                playerDidCollideWithEnemyShot(player, enemyProjectile)
            }
        }

        if firstBody.categoryBitMask == PhysicsCategory.enemyProjectile && secondBody.categoryBitMask == PhysicsCategory.player {
            if let enemyProjectile = firstBody.node as? SKSpriteNode,
               let player = secondBody.node as? SKSpriteNode {
                enemyShotDidCollideWithPlayer(enemyProjectile, player)
            }
        }
    }
}
