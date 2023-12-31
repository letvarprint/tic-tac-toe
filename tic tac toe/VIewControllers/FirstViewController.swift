//
//  FirstViewController.swift
//  tic tac toe
//
//  Created by Семен Шевчик on 04.11.2023.
//

import UIKit

final class FirstViewController: UIViewController {
    
    // MARK: - IBActions
    @IBAction func createPersonList(_ sender: UIBarButtonItem) {
        alert(title: "Создатели игры TicTacToe", message: "\nTeamLeader Alex \nDaniel Romanov \nSemyon Shevchik \nDmitriy Lebedev")
    }
    
    @IBAction func rulesButton(_ sender: UIBarButtonItem) {
        alert(title: "Правила игры", message: "Игроки по очереди ставят на свободные клетки поля 3×3 знаки (один всегда крестики, другой всегда нолики). Первый, выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или большой диагонали, выигрывает.")
    }
    
    // MARK: - private funcs
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
