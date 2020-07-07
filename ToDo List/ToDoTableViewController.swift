//
//  ToDoTableViewController.swift
//  ToDo List
//
//  Created by Alan Tran on 7/1/20.
//  Copyright © 2020 Protoalpha. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var toDoSwitch: UISwitch!
    
    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo(name: "Walk", isOn: true)
        let toDo2 = ToDo(name: "Run")

        toDos = [toDo1,toDo2]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ToDoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ToDoTableViewCell
        let toDo = toDos[indexPath.row]
        let prefix = toDo.isOn ? "❗️" : ""
        let toDoText = "\(prefix)\(toDo.name)"

        cell.toDoLabel.text = toDoText
        cell.toDoSwitch.isOn = toDo.isOn

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = toDos[indexPath.row]
        performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let createVC = segue.destination as? CreateToDoViewController {
            createVC.toDoTableVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController {
            if let toDo = sender as? ToDo {
                completeVC.toDo = toDo
                completeVC.toDoTableVC = self
            }
        }
    }
}
