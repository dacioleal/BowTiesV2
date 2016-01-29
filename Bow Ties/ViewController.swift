//
//  ViewController.swift
//  Bow Ties
//
//  Created by Dacio Leal Rodriguez on 4/1/16.
//  Copyright © 2016 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timesWornLabel: UILabel!
    @IBOutlet weak var lastWornLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var managedContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.insertSampleData()
        
    }
    
    @IBAction func segmentedControl(control: UISegmentedControl) {
        
    }
    
    @IBAction func wear(sender: AnyObject) {
        
    }
    
    @IBAction func rate(sender: AnyObject) {
        
    }
    
    func insertSampleData() {
        
        let path = NSBundle.mainBundle().pathForResource("SampleData", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: path!)
        
        for dict: AnyObject in dataArray! {
            
            let btDictionary = dict as! NSDictionary
            let entity = NSEntityDescription.entityForName("Bowtie", inManagedObjectContext: managedContext)
            let bowtie = Bowtie(entity: entity!, insertIntoManagedObjectContext: managedContext)
            bowtie.name = btDictionary["name"] as? String
            bowtie.searchKey = btDictionary["searchKey"] as? String
            bowtie.rating = btDictionary["rating"] as? NSNumber
            let tintColor = btDictionary["tintColor"] as? NSDictionary
            bowtie.tintColor = colorFromDict(tintColor!)
            
            
            
            
            
        }
    }
}

