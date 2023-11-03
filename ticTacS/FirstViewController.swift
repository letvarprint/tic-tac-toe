//
//  FirstViewController.swift
//  ticTacS
//
//  Created by Семен Шевчик on 03.11.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    @IBAction func buttonGame() {
    }
    
    @IBAction func tableLeaders() {
    }
    
    @IBAction func rulesButton(_ sender: UIBarButtonItem) {
        alert(title: "Правила игры", message: "Игроки по очереди ставят на свободные клетки поля 3×3 знаки (один всегда крестики, другой всегда нолики). Первый, выстроивший в ряд 3 своих фигуры по вертикали, горизонтали или большой диагонали, выигрывает.")
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
  
}
