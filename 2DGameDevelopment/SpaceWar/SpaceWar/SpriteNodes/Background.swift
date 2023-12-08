//
//  Background.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit

final class Background: SKSpriteNode {
    init(texture: SKTexture, size: CGSize, position: CGPoint, alpha: CGFloat) {
        super.init(texture: texture, color: .clear, size: size)

        setup(with: position, and: alpha)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(with position: CGPoint, and alpha: CGFloat) {
        self.zPosition = -1
        self.position = position
        self.alpha = alpha
    }
}
