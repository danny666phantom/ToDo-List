//
//  FirstViewController.swift
//  ToDo List
//
//  Created by [ r∆ven ] on 3/6/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//

import UIKit

    var toDoList = [String]()

class FirstViewController: UIViewController,
    UITableViewDelegate{
    
    
    @IBOutlet weak var toDoListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Sync with permanent storage.
        
        if
            NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil{
                
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return toDoList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        toDoListTable.reloadData()
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    
        if editingStyle == UITableViewCellEditingStyle.Delete{
        
            // Delete array.
            toDoList.removeAtIndex(indexPath.row)
            
            // Update permenant & reload
            
                NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
         
            toDoListTable.reloadData()
            
        }
    
    }
    
    
}

