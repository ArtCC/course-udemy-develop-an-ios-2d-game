//
//  ScoreManager.swift
//  SpaceWar
//
//  Created by Arturo Carretero Calvo on 10/12/23.
//

import Foundation

struct ScoreManager {
    private static let defaults = UserDefaults.standard

    static func getScore() -> Int {
        defaults.integer(forKey: Constants.Keys.score)
    }

    static func saveScore(_ score: Int) {
        score > getScore() ? defaults.setValue(score, forKey: Constants.Keys.score) : nil
    }
}
