//
//  LeaderBoardViewController.swift
//  tic tac toe
//
//  Created by Денис Сташков on 5.11.2023.
//

import UIKit

final class LeaderBoardViewController: UIViewController {
    
    var model: ChoiсePlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}

extension LeaderBoardViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderCell", for: indexPath)
        return cell
    }
    
    
}
