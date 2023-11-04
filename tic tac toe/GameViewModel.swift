//
//  GameViewModel.swift
//  tic tac toe
//
//  Created by Денис Сташков on 3.11.2023.
//

import Foundation

struct GameModel {
    let playerOne: String
    let playerTwo: String
    let playerCrossImage: String
    let playerRingImage: String
    let currentMove: String
}

struct ChoiсePlayer {
    let playerOne: String
    let playerTwo: String
}

struct LeaderBoard {
    let nickname: String
    let score: Int
}
