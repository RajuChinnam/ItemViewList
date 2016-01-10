//
//  AddItemListViewController.swift
//  ItemList
//
//  Created by subhash akkiraju on 1/6/16.
//  Copyright © 2016 Sparity. All rights reserved.
//

import UIKit
import CoreData

class AddItemListViewController: UIViewController {
    
    
    @IBOutlet weak var itemName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let entity =  NSEntityDescription.entityForName("ItemList",inManagedObjectContext:managedContext)
        
        let name = itemName.text! as String
        
        let item = NSManagedObject(entity: entity!,insertIntoManagedObjectContext: managedContext)
        item.setValue(name, forKey: "itemName")
        
        do {
            try managedContext.save()
            //itemlist.append(item)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
