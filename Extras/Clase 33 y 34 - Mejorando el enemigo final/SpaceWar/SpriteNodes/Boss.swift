//
//  Boss.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 10/12/23.
//

import SpriteKit

enum BossState {
    case evading(sprite: SKSpriteNode)
    case patrolling
}

final class Boss: Enemy {
    var health: Int = 5
    var state: BossState = .patrolling {
        didSet {
            switch state {
            case .evading(let sprite):
                evading(sprite)
            case .patrolling:
                patrolling()
            }
        }
    }
    var canEvade = true

    override func movement() {
        let startingX = UIScreen.main.bounds.width + size.width / 2
        let startingY = frame.size.height
        let endingX = UIScreen.main.bounds.width - 250
        let endingY = UIScreen.main.bounds.height - frame.size.height
        let duration = CGFloat.random(in: 3...6)

        position = CGPoint(x: startingX, y: startingY)

        let moveAction = SKAction.moveTo(x: endingX, duration: duration / 2)
        let moveUpAction = SKAction.moveTo(y: endingY, duration: duration / 2)
        let moveDownAction = SKAction.moveTo(y: startingY, duration: duration / 2)
        let sequence = SKAction.sequence([moveAction])

        run(sequence) {
            self.run(SKAction.repeatForever(SKAction.sequence([moveUpAction, moveDownAction])))
        }
    }

    private func evading(_ sprite: SKSpriteNode) {
        guard canEvade else {
            return
        }

        let distance = position.distance(to: sprite.position)

        if distance < UIScreen.main.bounds.width {
            evade(projectile: sprite)
        }
    }

    private func patrolling() {
        var moveActions: [SKAction] = []

        for _ in 1...5 {
            let randomPoint = generateRandomPoint()
            let moveAction = SKAction.move(to: randomPoint, duration: 2.0)
            moveActions.append(moveAction)
        }

        let patrolSequence = SKAction.sequence(moveActions)
        let repeatPatrol = SKAction.repeatForever(patrolSequence)

        run(repeatPatrol)
    }

    private func evade(projectile: SKSpriteNode) {
        let evasionVector = CGVector(dx: position.x - projectile.position.x, 
                                     dy: position.y - projectile.position.y).normalized()
        let evasionForce = CGVector(dx: evasionVector.dx * 500, dy: evasionVector.dy * 500)
        let evasionMove = SKAction.applyForce(evasionForce, duration: 0.5)

        run(evasionMove)

        canEvade = false

        run(SKAction.wait(forDuration: 0.5)) { [weak self] in
            guard let self else {
                return
            }
            self.canEvade = true
        }
    }

    private func generateRandomPoint() -> CGPoint {
        let patrolRangeX: ClosedRange<CGFloat> = size.width / 2...UIScreen.main.bounds.width
        let patrolRangeY: ClosedRange<CGFloat> = frame.size.height...UIScreen.main.bounds.height
        let randomX = CGFloat.random(in: patrolRangeX)
        let randomY = CGFloat.random(in: patrolRangeY)

        return CGPoint(x: randomX, y: randomY)
    }
}
