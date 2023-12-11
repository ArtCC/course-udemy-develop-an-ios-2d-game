//
//  GameScene.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit
import GameController
import GameplayKit

final class GameScene: SKScene {
    var player = Player()
    var gamepadDirection = CGPoint.zero

    override func didMove(to view: SKView) {
        createParallaxBackground()
        createPlayer()

        NotificationCenter.default.addObserver(self, 
                                               selector: #selector(controllerDidConnect),
                                               name: .GCControllerDidConnect,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(controllerDidDisconnect),
                                               name: .GCControllerDidDisconnect,
                                               object: nil)
    }

    override func update(_ currentTime: TimeInterval) {
        let newX = player.position.x + gamepadDirection.x * 3
        let newY = player.position.y + gamepadDirection.y * 3

        player.position = CGPoint(x: newX, y: newY)
    }

    @objc 
    func controllerDidConnect(notification: Notification) {
        guard let controller = notification.object as? GCController,
              let gamepad = controller.extendedGamepad else {
            return
        }

        gamepad.valueChangedHandler = { [weak self] (gamepad, element) in
            guard let self else {
                return
            }
            self.updateControls(gamepad: gamepad)
        }
    }

    @objc 
    func controllerDidDisconnect(notification: Notification) {
        gamepadDirection = .zero
    }

    func updateControls(gamepad: GCExtendedGamepad) {
        let x = CGFloat(gamepad.leftThumbstick.xAxis.value)
        let y = CGFloat(gamepad.leftThumbstick.yAxis.value)

        gamepadDirection = CGPoint(x: x, y: y)

        if gamepad.buttonA.isPressed {
            print("Disparar")
        } else {
            print("Deja de disparar")
        }
    }
}
