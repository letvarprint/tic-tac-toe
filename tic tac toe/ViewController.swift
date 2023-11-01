//
//  ViewController.swift
//  tic tac toe
//
//  Created by Alexandru Brixencov on 01.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    
    
    
    
    @IBOutlet weak var b11ImageView: UIImageView!
    @IBOutlet weak var b12ImageView: UIImageView!
    @IBOutlet weak var b21ImageView: UIImageView!
    @IBOutlet weak var b22ImageView: UIImageView!
    @IBOutlet weak var b31ImageView: UIImageView!
    @IBOutlet weak var b32ImageView: UIImageView!
    @IBOutlet weak var b41ImageView: UIImageView!
    @IBOutlet weak var b42ImageView: UIImageView!
    @IBOutlet weak var b51ImageView: UIImageView!
    @IBOutlet weak var b52ImageView: UIImageView!
    @IBOutlet weak var b61ImageView: UIImageView!
    @IBOutlet weak var b62ImageView: UIImageView!
    @IBOutlet weak var b71ImageView: UIImageView!
    @IBOutlet weak var b72ImageView: UIImageView!
    @IBOutlet weak var b81ImageView: UIImageView!
    @IBOutlet weak var b82ImageView: UIImageView!
    @IBOutlet weak var b91ImageView: UIImageView!
    @IBOutlet weak var b92ImageView: UIImageView!
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    override func viewDidLoad() {
      
    }
    @IBAction func Button(_ sender: UIButton) {
        let tag = sender.tag
        switch tag {
        case 1:
            if b11ImageView.isHidden && b12ImageView.isHidden {
                if playerOneLabel.font.isBold {
                   playerOneTurn(x: b11ImageView, button: oneButton)
                } else {
                    playerTwoTurn(o: b12ImageView, button: oneButton)
                }
            } else {break}
            case 2:
            if b21ImageView.isHidden && b22ImageView.isHidden {
                if playerOneLabel.font.isBold {
                    playerOneTurn(x: b21ImageView, button: twoButton)
                } else {
                    playerTwoTurn(o: b22ImageView, button: twoButton)
                }
            } else {break}
            case 3:
            if b31ImageView.isHidden && b32ImageView.isHidden {
                if playerOneLabel.font.isBold {
                    playerOneTurn(x: b31ImageView, button: threeButton)
                } else {
                    playerTwoTurn(o: b32ImageView, button: threeButton)
                }
            } else {break}
            case 4:
            if b41ImageView.isHidden && b42ImageView.isHidden {
                if playerOneLabel.font.isBold {
                    playerOneTurn(x: b41ImageView, button: fourButton)
                } else {
                    playerTwoTurn(o: b42ImageView, button: fourButton)
                }
            } else {break}
            case 5:
            if b51ImageView.isHidden && b52ImageView.isHidden {
                if playerOneLabel.font.isBold {
                playerOneTurn(x: b51ImageView, button: fiveButton)
            } else {
                playerTwoTurn(o: b52ImageView, button: fiveButton)
            }
        } else {break}
        case 6:
        if b61ImageView.isHidden && b62ImageView.isHidden {
            if playerOneLabel.font.isBold {
                playerOneTurn(x: b61ImageView, button: sixButton)
            } else {
                playerTwoTurn(o: b62ImageView, button: sixButton)
            }
        } else {break}
        case 7:
        if b71ImageView.isHidden && b72ImageView.isHidden {
            if playerOneLabel.font.isBold {
                playerOneTurn(x: b71ImageView, button: sevenButton)
            } else {
                playerTwoTurn(o: b72ImageView, button: sevenButton)
            }
            } else {break}
        case 8:
        if b81ImageView.isHidden && b82ImageView.isHidden {
            if playerOneLabel.font.isBold {
                playerOneTurn(x: b81ImageView, button: eightButton)
            } else {
                playerTwoTurn(o: b82ImageView, button: eightButton)
            }
            } else {break}
            default:
            if b91ImageView.isHidden && b92ImageView.isHidden {
                if playerOneLabel.font.isBold {
                    playerOneTurn(x: b91ImageView, button: nineButton)
                } else {
                    playerTwoTurn(o: b92ImageView, button: nineButton)
                }
                } else {break}
            }
    }
    
   private func standardFont() -> UIFont {
        UIFont.systemFont(ofSize: 16)
    }
    
   private func boldFont() -> UIFont {
        UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func playerOneTurn(x: UIView, button: UIButton) {
        x.isHidden = false
        button.alpha = 0
        playerOneLabel.font = standardFont()
        playerTwoLabel.font = boldFont()
        playerTurnLabel.text = "Ход Player 2"
        playerTurnLabel.textColor = UIColor.systemBlue
    }
    
    private func playerTwoTurn(o: UIView, button: UIButton) {
        o.isHidden = false
        button.alpha = 0
        playerTwoLabel.font = standardFont()
        playerOneLabel.font = boldFont()
        playerTurnLabel.text = "Ход Player 1"
        playerTurnLabel.textColor = UIColor.red
    }
    
}

extension UIFont {
    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
}

