import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    @IBOutlet var xImageViews: [UIImageView]!
    @IBOutlet var oImageViews: [UIImageView]!
    
    @IBOutlet var buttons: [UIButton]!
    
    private var currentPlayer: Player = .player1
    
    private var boardState = [Player?](repeating: nil, count: 9)
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func Button(_ sender: UIButton) {
        let tag = sender.tag
        let index = tag - 1
        
        boardState[index] = currentPlayer
        
        let xImageView = xImageViews[index]
        let oImageView = oImageViews[index]
        
        if currentPlayer == .player1 {
            takeTurn(x: xImageView, button: sender)
        } else {
            takeTurn(o: oImageView, button: sender)
        }
        
        if checkForWinner() == .player1 {
            showAlert(with: "Player 1 wins", and: "Game is over")
        } else if checkForWinner() == .player2 {
            showAlert(with: "Player 2 wins", and: "Game is over")
        } else if boardIsFull() {
            showAlert(with: "Draw", and: "Game is over")
        }
    }
    
        private func standardFont() -> UIFont {
            UIFont.systemFont(ofSize: 16)
        }
        
        private func boldFont() -> UIFont {
            UIFont.boldSystemFont(ofSize: 16)
        }
        
        private func takeTurn(x: UIView? = nil, o: UIView? = nil, button: UIButton) {
            x?.isHidden = false
            o?.isHidden = false
            
            button.alpha = 0
            button.isUserInteractionEnabled = false
            
            let isXNotNil = x != nil
            
            playerOneLabel.font = isXNotNil ? standardFont() : boldFont()
            playerTwoLabel.font = !isXNotNil ? boldFont() : standardFont()
            playerTurnLabel.text = isXNotNil ? "Ход Player 2" : "Ход Player 1"
            playerTurnLabel.textColor = isXNotNil ? UIColor.systemBlue : UIColor.red
            currentPlayer = isXNotNil ? .player2 : .player1
            
            
        }
        
    private func checkForWinner() -> Player? {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Горизонтали
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Вертикали
            [0, 4, 8], [2, 4, 6] // Диагонали
        ]
        
        for pattern in winPatterns {
            if pattern.allSatisfy({ boardState[$0] == .player1 }) {
                return .player1// Первый игрок выиграл
            } else if pattern.allSatisfy({boardState[$0] == .player2 }) {
                return .player2 // Второй игрок выиграл
            }
        }
        return nil
        }
    
    private func boardIsFull() -> Bool {
        if !boardState.contains(nil) {
            return true
        } else {
            return false
        }
    }
    
        
        private func showAlert(with title: String, and message: String) {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }


    enum Player {
        case player1
        case player2
    }
    
    extension UIFont {
        var isBold: Bool {
            return fontDescriptor.symbolicTraits.contains(.traitBold)
        }
    }
    

