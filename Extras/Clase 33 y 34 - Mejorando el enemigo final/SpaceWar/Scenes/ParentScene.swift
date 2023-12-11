//
//  ParentScene.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 10/12/23.
//

import SpriteKit

class ParentScene: SKScene {
    var scoreLabel = SKLabelNode(text: "")

    func createScoreLabel() {
        let score = String(ScoreManager.getScore())

        scoreLabel.zPosition = 6
        scoreLabel.text = String(format: NSLocalizedString("score.text", comment: ""), score)
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.verticalAlignmentMode = .top
        scoreLabel.position = CGPoint(x: size.width - 35, y: size.height - 35)

        addChild(scoreLabel)
    }
}
