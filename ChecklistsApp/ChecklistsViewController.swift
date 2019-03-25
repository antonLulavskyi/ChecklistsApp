//
//  ViewController.swift
//  ChecklistsApp
//
//  Created by Test on 25/03/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit

class ChecklistsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Walk the mom"
        } else if indexPath.row == 1 {
            label.text = "Play the game"
        } else if indexPath.row == 2 {
            label.text = "Go home"
        } else if indexPath.row == 3 {
            label.text = "Go sleep"
        }
        
        return cell
    }
    
}

