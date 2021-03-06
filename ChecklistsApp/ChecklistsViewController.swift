//
//  ViewController.swift
//  ChecklistsApp
//
//  Created by Test on 25/03/2019.
//  Copyright © 2019 Peanch. All rights reserved.
//

import UIKit

class ChecklistsViewController: UITableViewController {

    var items: [ChecklistItem]
   
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        super.init(coder: aDecoder)
        createItem(text: "Walk the pig", checked: false)
        createItem(text: "Learn how to walk", checked: false)
        createItem(text: "Brush my dad's teeth", checked: true)
        createItem(text: "Do some stuff", checked: false)
        createItem(text: "Utach baby", checked: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad was loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            controller.delegate = self
        }
    }
    
    func createItem(text: String, checked: Bool) {
        let newItem = ChecklistItem()
        newItem.text = text
        newItem.checked = checked
        items.append(newItem)
    }
    
    
    // Using tags is a handy trick to get a reference to a UI element without having to make an @IBOutlet variable for it.
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

    //MARK: - Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    //MARK: - Delegate Methods
    
    // This method does nselect rows
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // remove the item from the data model
        items.remove(at: indexPath.row)
        
        // delete the corresponding row from the tableview
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}

extension ChecklistsViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        dismiss(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
        dismiss(animated: true)
    }
    
    
}
