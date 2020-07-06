//
//  CreateToDoViewController.swift
//  ToDo List
//
//  Created by Alan Tran on 7/6/20.
//  Copyright © 2020 Protoalpha. All rights reserved.
//

import UIKit

class CreateToDoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    var toDoTableVC : ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addTapped(_ sender: Any) {
        if let name =  nameTextField.text {
            let newToDo = ToDo(name: name, isOn: true)
            toDoTableVC?.toDos.append(newToDo)
            toDoTableVC?.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
