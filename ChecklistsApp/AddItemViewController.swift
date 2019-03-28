//
//  AddItemViewController.swift
//  ChecklistsApp
//
//  Created by Test on 27/03/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
}

class AddItemViewController: UIViewController {

    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addItemTextField.delegate = self
    }
    @IBAction func addButton(_ sender: UIButton) {
        let item = ChecklistItem()
        item.text = addItemTextField.text!
        item.checked = true
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        delegate?.addItemViewControllerDidCancel(self)
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


}
//MARK: - UITextField Delegate
extension AddItemViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = addItemTextField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        // Button is enabled if newText.lenght > 0 else button !enabled
        addButton.isEnabled = (newText.length > 0)
        return true
    }
}
