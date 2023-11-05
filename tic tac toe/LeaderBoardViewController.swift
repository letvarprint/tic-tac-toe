//
//  LeaderBoardViewController.swift
//  tic tac toe
//
//  Created by Денис Сташков on 5.11.2023.
//

import UIKit

final class LeaderBoardViewController: UIViewController {
    
    var model: ChoiсePlayer!
    
    var gameHistories: [String:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
//    private func addHistories() -> [String:String] {
//        gameHistories.key
//    }
}

extension LeaderBoardViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameHistories.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderCell", for: indexPath)
        return cell
    }
    
    
}
