//
//  ToDoItem.swift
//  ToDo
//
//  Created by Claudia Tse on 10/18/16.
//  Copyright © 2016 Claudia Tse. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool
    var completionDate: NSDate? = nil
    
    init(name:String){
        self.itemName = name as NSString
        self.completed = false
        
    }

}
