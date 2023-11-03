//
//  GameViewModel.swift
//  tic tac toe
//
//  Created by Денис Сташков on 3.11.2023.
//

import Foundation

struct GameModel {
    let playerOne: ChoiсePlayer
    let playerTwo: ChoiсePlayer
    let playerCrossImage: String
    let playerRingImage: String
    let currentMove: String
}

extension GameModel {
    private func getModel() -> GameModel {
        GameModel(playerOne: <#T##ChoiсePlayer#>, playerTwo: <#T##ChoiсePlayer#>, playerCrossImage: <#T##String#>, playerRingImage: <#T##String#>, currentMove: <#T##String#>)
    }
}
