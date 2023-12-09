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
               let playerProjectile = firstBody.node as? SKSpriteNode {
                enemyDidCollideWithPlayerShot(enemy, playerProjectile)
            }
        } else if firstBody.categoryBitMask == PhysicsCategory.playerProjectile && secondBody.categoryBitMask == PhysicsCategory.enemy {
            if let playerProjectile = firstBody.node as? SKSpriteNode,
               let enemy = firstBody.node as? SKSpriteNode {
                playerDidCollideWithEnemy(playerProjectile, enemy)
            }
        } else if firstBody.categoryBitMask == PhysicsCategory.enemy && secondBody.categoryBitMask == PhysicsCategory.player {
            if let enemy = firstBody.node as? SKSpriteNode,
               let player = firstBody.node as? SKSpriteNode {
                enemyDidCollideWithPlayer(enemy, player)
            }
        } else if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemy {
            if let player = firstBody.node as? SKSpriteNode,
               let enemy = firstBody.node as? SKSpriteNode {
                playerDidCollideWithEnemy(player, enemy)
            }
        } else if firstBody.categoryBitMask == PhysicsCategory.player && secondBody.categoryBitMask == PhysicsCategory.enemyProjectile {
            if let player = firstBody.node as? SKSpriteNode,
               let enemyProjectile = firstBody.node as? SKSpriteNode {
                playerDidCollideWithEnemyShot(player, enemyProjectile)
            }
        } else if firstBody.categoryBitMask == PhysicsCategory.enemyProjectile && secondBody.categoryBitMask == PhysicsCategory.player {
            if let enemyProjectile = firstBody.node as? SKSpriteNode,
               let player = firstBody.node as? SKSpriteNode {
                enemyShotDidCollideWithPlayer(enemyProjectile, player)
            }
        }
    }
}
