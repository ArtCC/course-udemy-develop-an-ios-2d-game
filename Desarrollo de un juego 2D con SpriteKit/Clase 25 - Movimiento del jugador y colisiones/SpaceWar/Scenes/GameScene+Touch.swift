//
//  GameScene+Touch.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)

            if let node = atPoint(touchLocation) as? SKSpriteNode {
                if node.name == Nodes.joystick.rawValue {
                    joystickIsActive = CGRectContainsPoint(joystick.frame, touchLocation)
                    selectedNodes[touch] = node
                } else if node.name == Nodes.firePad.rawValue {
                    print("Dispara")
                }
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)

            if let node = selectedNodes[touch], node.name == Nodes.joystick.rawValue {
                if joystickIsActive {
                    let vector = CGVector(dx: touchLocation.x - joystickBase.position.x,
                                          dy: touchLocation.y - joystickBase.position.y)
                    let angle = atan2(vector.dy, vector.dx)
                    let radio: CGFloat = joystickBase.frame.size.height / 2
                    let distance = min(vector.dx * vector.dx + vector.dy * vector.dy, radio)
                    let xDist: CGFloat = distance * cos(angle)
                    let yDist: CGFloat = distance * sin(angle)

                    joystick.position = CGPoint(x: joystickBase.position.x + xDist, y: joystickBase.position.y + yDist)

                    let xDistPlayer: CGFloat = sin(angle - 1.57079633) * radio
                    let yDistPlayer: CGFloat = cos(angle - 1.57079633) * radio

                    playerVelocityX = xDistPlayer / radio
                    playerVelocityY = yDistPlayer / radio
                }
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if selectedNodes[touch] != nil {
                if joystickIsActive {
                    let defaultPosition: SKAction = SKAction.move(to: joystickBase.position, duration: 0.05)
                    defaultPosition.timingMode = SKActionTimingMode.easeOut

                    joystick.run(defaultPosition)

                    joystickIsActive = false

                    playerVelocityX = 0
                    playerVelocityY = 0
                }

                selectedNodes[touch] = nil
            }
        }
    }
}
