//
//  AddToDoItemViewController.swift
//  ToDo
//
//  Created by Claudia Tse on 10/18/16.
//  Copyright © 2016 Claudia Tse. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    var toDoItem: ToDoItem?

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != doneButton {
            return
        }
        if (textField.text?.characters.count)! > 0 {
            self.toDoItem = ToDoItem(name: self.textField.text!)
        }
    }
}

