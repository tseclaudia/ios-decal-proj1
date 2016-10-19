//
//  DailyStatsViewController.swift
//  ToDo
//
//  Created by Claudia Tse on 10/19/16.
//  Copyright © 2016 Claudia Tse. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {

    @IBOutlet var statsLabel: UILabel!
    public var numCompletedToDos: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statsLabel.text = String(numCompletedToDos)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
