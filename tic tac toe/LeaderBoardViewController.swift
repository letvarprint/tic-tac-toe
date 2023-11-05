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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
