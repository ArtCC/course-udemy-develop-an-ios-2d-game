//
//  Boss.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 10/12/23.
//

import SpriteKit

final class Boss: Enemy {
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
}
