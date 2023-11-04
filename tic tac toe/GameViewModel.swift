//
//  GameViewModel.swift
//  tic tac toe
//
//  Created by Денис Сташков on 3.11.2023.
//

import Foundation

struct ChoiсePlayer {
    let playerOneTF: String
    let playerTwoTF: String
    let game: GameModel
    let leaderBoard: LeaderBoard
}
struct GameModel {
    let playerOne: String
    let playerTwo: String
    let playerCrossImage: String
    let playerRingImage: String
    let currentMove: String
    let playerOneScore: Int
    let playerTwoScore: Int
    let leaderBoard: LeaderBoard
}

struct LeaderBoard {
    let winerName: String
    let score: Int
}

extension ChoiсePlayer {
}
