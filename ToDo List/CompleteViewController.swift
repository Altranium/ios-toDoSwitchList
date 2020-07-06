//
//  CompleteViewController.swift
//  ToDo List
//
//  Created by Alan Tran on 7/6/20.
//  Copyright © 2020 Protoalpha. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    var toDo = ToDo()
    var toDoTableVC : ToDoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if toDo.isOn {
            toDoLabel.text = "❗️" + toDo.name
        } else {
            toDoLabel.text = toDo.name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        if let toDos = toDoTableVC?.toDos {
            var index = 0
            for x in toDos {
                if x.name == toDo.name {
                    toDoTableVC?.toDos.remove(at: index)
                    toDoTableVC?.tableView.reloadData()
                    navigationController?.popViewController(animated: true)
                    return
                }
                index += 1
            }
        }
    }
    
}
