//
//  ViewController.swift
//  Todoey
//
//  Created by DMD MAX on 28/03/2019.
//  Copyright © 2019 DMDMAX. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Bilal" , "Buy Egos" , "LBC"]


    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = UserDefaults.standard.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    // add button functionality
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add ITem", style: .default) {
            (action) in
            
            self.itemArray.append(textField.text!)
//            UserDefaults.standard.set(self.itemArray, value(forKey: "TodoListArray"))
            UserDefaults.standard.set(self.itemArray, forKey: "TodoListArray")

            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert , animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType  = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType  = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

