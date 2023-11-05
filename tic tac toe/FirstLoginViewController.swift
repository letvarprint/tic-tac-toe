//
//  FirstLoginViewController.swift
//  tic tac toe
//
//  Created by Семен Шевчик on 04.11.2023.
//

import UIKit

final class FirstLoginViewController: UIViewController {
    
    // MARK: - IbOutlets
    @IBOutlet weak var userOne: UITextField!
    @IBOutlet weak var userTwo: UITextField!
    
    // MARK: - Private propeties
    private let model = ChoiсePlayer.getModel()
    
    // MARK: - Overrides
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameVC = segue.destination as? GameViewController else { return }
        gameVC.playerOne = userOne.text
        gameVC.playerTwo = userTwo.text
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction private func unwind(for segue: UIStoryboardSegue) {
    }
    
    @IBAction func gameStart(_ sender: Any) {
        if let textOne = userOne.text,
           let textTwo = userTwo.text,
           !textOne.isEmpty,
           !textTwo.isEmpty {
            performSegue(withIdentifier: "gameVC", sender: nil)
        } else {
            showAlert(
                title: "Ошибка при вводе имени игрока",
                message: "Поля имени для игрока должны быть заполнены"
            )
        }
        
        // MARK: - Public funcs
        func showAlert(title: String, message: String, textField: UITextField? = nil) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                textField?.text = ""
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
}
