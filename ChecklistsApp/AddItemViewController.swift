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
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addItemTextField.delegate = self
    }
    @IBAction func addButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Did End on Exit event of UITextField(button Done on the keyboard) follow functionallety of the Add button
    @IBAction func doneButton(_ sender: UITextField) {
       dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This method make keyboard automatically appeared once the screen opens.
        addItemTextField.becomeFirstResponder()
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

extension AddItemViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = addItemTextField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        if newText.length > 0 {
            addButton.isEnabled = true
        } else {
            addButton.isEnabled = false
        }
        return true
    }
}
