//
//  ToDoListTableViewController.swift
//  ToDo
//
//  Created by Claudia Tse on 10/18/16.
//  Copyright © 2016 Claudia Tse. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var toDoItems = [ToDoItem]()
    
    @IBAction func unwindToTableViewController(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? AddToDoItemViewController ,
            let item = sourceViewController.toDoItem {
            // Pull any data from the view controller which initiated the unwind segue.
            //        var source: ViewController = sender.sourceViewController as ViewController
                self.toDoItems.append(item)
                self.tableView.reloadData()
        }
    }
    
    func deleteCompletedTodos() {
        for i in 0..<toDoItems.count {
            let todo = toDoItems[i]
            if todo.completed {
                if (Int(Date().timeIntervalSince(todo.completionDate as! Date) / 3600) >= 24) {
                    self.toDoItems.remove(at: i)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteCompletedTodos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoItems.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let todoitem: ToDoItem = self.toDoItems[indexPath.row]
        cell.textLabel?.text = todoitem.itemName as String
        if todoitem.completed{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            // Delete the row from the data source
            self.toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt: IndexPath) {
        let cell = tableView.cellForRow(at: didSelectRowAt)
        let todoitem: ToDoItem = self.toDoItems[didSelectRowAt.row]
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
            todoitem.completed = true
            todoitem.completionDate = Date() as NSDate?
            
        } else {
            cell?.accessoryType = .none
            todoitem.completed = false
            todoitem.completionDate = nil
        }
        tableView.deselectRow(at: didSelectRowAt, animated: true)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsSegue" {
            let svc: DailyStatsViewController = segue.destination as! DailyStatsViewController
            var num = 0
            for todo in toDoItems {
                if todo.completed {
                    if (Int(Date().timeIntervalSince(todo.completionDate as! Date) / 3600) < 24) {
                        num += 1
                    }
                }
            }
            svc.numCompletedToDos = num
        }
    }
}
