//
//  LeaderBoardViewController.swift
//  tic tac toe
//
//  Created by Денис Сташков on 5.11.2023.
//

import UIKit

final class LeaderBoardViewController: UIViewController {
    // MARK: - Public properties
    var playerOne: String!
    var playerTwo: String!
    
    var dataBase = DataBase.shared.data
    
    var data = DataBase.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.sortDictionary()
        print(dataBase.count)
        for (name, score) in dataBase {
            print(name, score)
        }
    }
    // MARK: - IBAcations
    @IBAction func homeButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goHome", sender: self)
    }
}

extension LeaderBoardViewController: UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderCell", for: indexPath)
        let dataArray = Array(dataBase)
        let (name, score) = dataArray[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(name): \(score)"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Таблица лидеров"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
