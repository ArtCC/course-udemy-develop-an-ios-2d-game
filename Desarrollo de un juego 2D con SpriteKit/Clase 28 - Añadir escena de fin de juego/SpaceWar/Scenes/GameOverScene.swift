//
//  GameOverScene.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 10/12/23.
//

import SpriteKit
import GameplayKit

class GameOverScene: SKScene {
    private struct SceneTraits {
        // Size
        static let titleFontSize: CGFloat = 60

        // Alpha
        static let alpha: CGFloat = 0.4

        // Duration
        static let animation: CGFloat = 0.25
    }

    private var win = false

    init(size: CGSize, win: Bool) {
        super.init(size: size)

        self.win = win
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        createBackground()
        createTitleLabel()
        presentMainMenuScene()
    }

    private func createBackground() {
        guard let image = UIImage(named: Constants.Images.background),
              let scene else {
            return
        }
        let texture = SKTexture(image: image)
        let background = Background(texture: texture,
                                    size: scene.frame.size,
                                    position: CGPoint(x: scene.frame.midX, y: scene.frame.midY),
                                    alpha: SceneTraits.alpha)
        addChild(background)
    }

    private func createTitleLabel() {
        let text = win ? NSLocalizedString("game.over.win", comment: "") : NSLocalizedString("game.over.lose", comment: "")
        let titleLabel = SKLabelNode(text: text)
        titleLabel.fontSize = SceneTraits.titleFontSize
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .center
        titleLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)

        addChild(titleLabel)
    }

    private func presentMainMenuScene() {
        run(SKAction.sequence([
            SKAction.wait(forDuration: 3),
            SKAction.run { [weak self] in
                guard let self else {
                    return
                }
                let transition = SKTransition.crossFade(withDuration: SceneTraits.animation)
                let mainMenuScene = MainMenuScene(size: self.size)

                self.view?.presentScene(mainMenuScene, transition: transition)
            }
        ]))
    }
}
