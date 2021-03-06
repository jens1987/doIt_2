//
//  ViewController.swift
//  Doit_new
//
//  Created by Jens Kühnapfel on 06.01.17.
//  Copyright © 2017 Jens Kühnapfel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTask()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "!!!\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func makeTask() -> [Task] {
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = true
        
        
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Cook meal"
        task3.important = false
        
        
        return [task1, task2,task3]
    }
    
    
    @IBAction func plusTappeld(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
  
    
}

