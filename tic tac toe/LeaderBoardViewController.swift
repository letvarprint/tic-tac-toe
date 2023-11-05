//
//  LeaderBoardViewController.swift
//  tic tac toe
//
//  Created by Денис Сташков on 5.11.2023.
//

import UIKit

final class LeaderBoardViewController: UIViewController {

    var playerOne: String!
    var playerTwo: String!
    
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goHome", sender: self)
    }
   
}

extension LeaderBoardViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "❌ \(playerOne ?? "123")  vs ⭕️ \(playerTwo ?? "123")"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "История игр"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
