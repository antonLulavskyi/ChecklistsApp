//
//  AddItemViewController.swift
//  ChecklistsApp
//
//  Created by Test on 27/03/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var addItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func addButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
