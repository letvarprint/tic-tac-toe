import UIKit

final class GameViewController: UIViewController {
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    @IBOutlet weak var playerOneScore: UILabel!
    @IBOutlet weak var playerTwoScore: UILabel!
    
    @IBOutlet var xImageViews: [UIImageView]!
    @IBOutlet var oImageViews: [UIImageView]!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    
    private var currentPlayer: Player = .player1
    
    private var playerOneWins: String!
    private var playerTwoWins: String!
    private let draw = "Draw"
    private let gameIsOver = "Game is over"
    private var boardState = [Player?](repeating: nil, count: 9)
    
    var model: ChoiсePlayer!
    
    var playerOne: String?
    var playerTwo: String?
    
    override func viewDidLoad() {
        setupView()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let leaderVC = segue.destination as? LeaderBoardViewController else { return }
        leaderVC.model = model
    }
//MARK: - IBAction
    @IBAction func makeGameAction(_ sender: UIButton) {
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
            showAlert(with: playerOneWins, and: gameIsOver)
            updateScore(for: playerOneScore)
        } else if checkForWinner() == .player2 {
            showAlert(with: playerTwoWins, and: gameIsOver)
            updateScore(for: playerTwoScore)
        } else if checkBoardIsFull() {
            showAlert(with: draw, and: gameIsOver)
        }
    }
    
    @IBAction func makeReset() {
        resetGame()
    }
    
    @IBAction func switchScreen(_ sender: UIButton) {
        let tag = sender.tag
        switch tag {
        case 10:
            print("Переход на в главное меню")
            // Тут надо сделать сегвей
        default:
            print("Переход на таблицу лидеров")
            // Тут надо сделать сегвей
        }
    }
    
//MARK: - MainGameLogic
    private func takeTurn(x: UIView? = nil, o: UIView? = nil, button: UIButton) {
        x?.isHidden = false
        o?.isHidden = false
        
        button.isUserInteractionEnabled = false
        
        let isXNotNil = x != nil
        
        playerTurnLabel.text = isXNotNil ? "Ход \(playerTwo ?? "123") ❌ " : "Ход \(playerOne ?? "123") ⭕️"
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
    
    private func checkBoardIsFull() -> Bool {
        if !boardState.contains(nil) {
            return true
        } else {
            return false
        }
    }
    
    private func resetGame() {
        for xImage in xImageViews {
            xImage.isHidden = true
        }
        for oImage in oImageViews {
            oImage.isHidden = true
        }
        for button in buttons {
            button.isUserInteractionEnabled = true
        }
        boardState = [Player?](repeating: nil, count: 9)
        currentPlayer = .player1
        playerTurnLabel.text = "Ход Player 1"
        playerTurnLabel.textColor = UIColor.red
    }
    
    private func updateScore(for player: UILabel) {
        player.text = String((Int(player.text ?? "0") ?? 0) + 1)
    }
    
    private func setupView() {
        playerOneLabel.text = playerOne
        playerTwoLabel.text = playerTwo
        playerOneWins = "\(playerOne ?? "123") wins"
        playerTwoWins = "\(playerTwo ?? "123") wins"
        for button in buttons {
            button.layer.borderWidth = 3.0
            button.layer.borderColor = UIColor.black.cgColor
        }
        homeButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        leaderboardButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
//MARK: - ButtonAnimation
    @objc func buttonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.15, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
            }
        }
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
//MARK: - UIAlertController
extension GameViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert
        )
        
        let returnAction = UIAlertAction(title: "Сыграть снова", style: .default) { _ in self.resetGame()}
        let playAgainAction = UIAlertAction(title: "Главное меню", style: .default)
        
        
        alert.addAction(returnAction)
        alert.addAction(playAgainAction)
        present(alert, animated: true)
    }
}
