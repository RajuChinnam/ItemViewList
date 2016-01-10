//
//  ViewController.swift
//  ItemList
//
//  Created by subhash akkiraju on 1/6/16.
//  Copyright © 2016 Sparity. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource {
    
    var itemlist = [NSManagedObject]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemlist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let item = itemlist[indexPath.row]
        
        cell.textLabel?.text = item.valueForKey("itemName") as? String
        return cell
    }
    
    
    @IBAction func saveItem(segue: UIStoryboardSegue) {
        
        self.tableView.reloadData()
        
    }
    
    // Called from the destination controller via delegation
    /*func setItem(name: String) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("ItemList",inManagedObjectContext:managedContext)
        
        let item = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        item.setValue(name, forKey: "itemName")
        
        do {
            try managedContext.save()
            itemlist.append(item)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }*/
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
       
        let fetchRequest = NSFetchRequest(entityName: "ItemList")
        
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            itemlist = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

}

