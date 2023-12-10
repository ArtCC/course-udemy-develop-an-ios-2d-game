//
//  MainMenuScene.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 8/12/23.
//

import SpriteKit
import GameplayKit

final class MainMenuScene: ParentScene {
    private struct SceneTraits {
        // Margin
        static let titleLabelX: CGFloat = 50
        static let titleLabelY: CGFloat = 15

        // Size
        static let titleFontSize: CGFloat = 60
        static let playLabelFontSize: CGFloat = 65

        // Alpha
        static let alpha: CGFloat = 0.4

        // Duration
        static let animation: CGFloat = 0.25
    }

    private enum MainMenuOption: String {
        case game
    }

    override func didMove(to view: SKView) {
        createBackground()
        createTitleLabel()
        createPlayLabel()
        createScoreLabel()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)

            if node.name == MainMenuOption.game.rawValue {
                routeToPlayGame()
            }
        }
    }

    // MARK: - Private

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
        let titleLabel = SKLabelNode(text: NSLocalizedString("name.game.title.text", comment: ""))
        titleLabel.fontSize = SceneTraits.titleFontSize
        titleLabel.horizontalAlignmentMode = .left
        titleLabel.verticalAlignmentMode = .top
        titleLabel.position = CGPoint(x: SceneTraits.titleLabelX, y: size.height - SceneTraits.titleLabelY)

        addChild(titleLabel)
    }

    private func createPlayLabel() {
        let scoreLabel = SKLabelNode(text: NSLocalizedString("play.button.text", comment: ""))
        scoreLabel.fontSize = SceneTraits.playLabelFontSize
        scoreLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        scoreLabel.name = MainMenuOption.game.rawValue

        addChild(scoreLabel)
    }

    private func routeToPlayGame() {
        let transition = SKTransition.crossFade(withDuration: SceneTraits.animation)
        let gameScene = GameScene(size: self.size)

        view?.presentScene(gameScene, transition: transition)
    }
}
