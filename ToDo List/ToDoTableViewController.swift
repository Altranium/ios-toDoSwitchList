//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Alan Tran on 7/1/20.
//  Copyright © 2020 Protoalpha. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo()
        toDo1.name = "buy milk"
        toDo1.important = true
        
        let toDo2 = ToDo()
        toDo2.name = "walk the dog"
        toDo2.important = false
        
        toDos = [toDo1, toDo2]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        // Configure the cell...
        let toDo = toDos[indexPath.row]
        cell.textLabel?.text = toDo.name

        return cell
    }
    
}
