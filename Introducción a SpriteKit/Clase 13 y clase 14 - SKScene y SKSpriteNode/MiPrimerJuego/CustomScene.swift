//
//  CustomScene.swift
//  MiPrimerJuego
//
//  Created by Arturo Carretero Calvo on 4/12/23.
//

import SpriteKit
import GameplayKit

class CustomScene: SKScene {
    override func didMove(to view: SKView) {
        guard let image = UIImage(named: "img_ship") else {
            return
        }
        let texture = SKTexture(image: image)
        let player = SKSpriteNode(texture: texture)

        let position = CGPoint(x: size.width * 0.15, y: size.height * 0.5)

        player.position = position

        addChild(player)
    }

    func touchDown(atPoint pos : CGPoint) {
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }

    override func update(_ currentTime: TimeInterval) {
    }
}
