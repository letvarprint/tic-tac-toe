//
//  FirstLoginViewController.swift
//  ticTacS
//
//  Created by Семен Шевчик on 03.11.2023.
//

import UIKit

class FirstLoginViewController: UIViewController {
    
    @IBOutlet weak var userOne: UITextField!
    @IBOutlet weak var userTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func gameStart(_ sender: Any) {
        if let textOne = userOne.text,
           let textTwo = userTwo.text,
           !textOne.isEmpty,
           !textTwo.isEmpty {
            performSegue(withIdentifier: "secondVC", sender: nil)
        } else {
            showAlert(
                title: "Ошибка при вводе имени игрока",
                message: "Поля имени для игрока должны быть заполнены"
            )
        }
        
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
    
 



