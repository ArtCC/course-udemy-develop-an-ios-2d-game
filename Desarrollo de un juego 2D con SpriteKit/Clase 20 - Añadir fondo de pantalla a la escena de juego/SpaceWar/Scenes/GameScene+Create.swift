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
}
