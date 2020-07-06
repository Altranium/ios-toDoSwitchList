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
    var toDoNames : [String] = []
    var toDoSwitches : [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDo1 = ToDo()
        toDo1.name = "Walk"
        toDo1.isOn = true
        
        let toDo2 = ToDo()
        toDo2.name = "Run"
        toDo2.isOn = false
        
        toDos = [toDo1,toDo2]
        toDoNames = [toDo1.name, toDo2.name]
        toDoSwitches = [toDo1.isOn, toDo2.isOn]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//      Link to Prototype Cell class
         
//        let cellIdentifier = "Cell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ToDoTableViewCell
//        cell.toDoLabel.text = toDoNames[indexPath.row]
//        cell.toDoSwitch.isOn = toDoSwitches[indexPath.row]
         
        
        
        
        let cell = UITableViewCell()

        let toDo = toDos[indexPath.row]

        if toDo.isOn {
            cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }

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
