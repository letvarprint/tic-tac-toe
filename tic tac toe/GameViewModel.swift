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

}
struct GameModel {
    let playerOne: String
    let playerTwo: String
    let currentMove: String
    let playerOneScore: Int
    let playerTwoScore: Int
    let leaderBoard: LeaderBoard
}

struct LeaderBoard {
    let playerOne: String
    let playerTwo: String
    let gameScore: String
}

extension ChoiсePlayer {
   static func getModel() -> ChoiсePlayer {
        ChoiсePlayer(
            playerOneTF: "123",
            playerTwoTF: "123",
            game: GameModel.getGameModel())
    }
}
extension GameModel {
    static func getGameModel() -> GameModel {
        GameModel(
            playerOne: "123",
            playerTwo: "123",
            currentMove: "",
            playerOneScore: 0,
            playerTwoScore: 0,
            leaderBoard: LeaderBoard.getLeader()
        )
    }
}

extension LeaderBoard {
    static func getLeader() -> LeaderBoard {
        LeaderBoard(playerOne: "", playerTwo: "", gameScore: "")
    }
}

enum Players {
    case player1
    case player2
}
